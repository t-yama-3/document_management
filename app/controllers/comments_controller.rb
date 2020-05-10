class CommentsController < ApplicationController
  before_action :move_to_user_registration

  def create
    @comment = Comment.new(comment_params)
    return redirect_to document_path(@comment.document.id) unless @comment.document.section.participate_user_ids.include?(current_user.id)
    if @comment.save
      redirect_to document_path(@comment.document.id)
    else
      @document = Document.find(params[:document_id])
      flash.now[:alert] = @comment.errors.full_messages
      render "documents/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id, document_id: params[:document_id])
  end

  def move_to_user_registration
    redirect_to new_user_registration_path unless user_signed_in?
  end
end
