class MarkingsController < ApplicationController
  before_action :set_document

  def create
    @marking = Marking.create(user_id: current_user.id, document_id: @document.id)
    if @marking.save
      respond_to do |format|
        format.html { render "documents/show" }
        format.json { render json: { count: @document.markings.length } }
      end
    end
  end

  def destroy
    @marking = Marking.find_by(user_id: current_user.id, document_id: @document.id)
    if @marking.destroy
      respond_to do |format|
        format.html { render "documents/show" }
        format.json { render json: { count: @document.markings.length } }
      end
    end
  end

  private
  def set_document
    @document = Document.find(params[:document_id])
  end
end
