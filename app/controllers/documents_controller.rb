class DocumentsController < ApplicationController
  before_action :move_to_user_registration, except: [:index]
  before_action :set_owner_sections, except: [:destroy]
  
  def index
    # なんか迂遠なことやってる（後日シンプルにする：自分が作成したものはマイページのみ表示でいい！）
    return @user_sections = [] unless user_signed_in?
    sections = current_user.participate_sections + Section.where(user_id: current_user.id)
    @user_sections = (sections.uniq).sort_by!{|ms|ms.created_at}.reverse!
    # sections = current_user.participate_sections.where.not(user_id: current_user.id) + Section.where(user_id: current_user.id)
    # @user_sections = sections.sort_by!{|ms|ms.created_at}.reverse!
  end

  def new
    @document = Document.new
  end

  def create
    new_document_params = document_params
    if section_params[:section_name] != ""
      section = Section.new(section_params)
      section.participate_users << current_user
      if section.save
        new_document_params[:section_id] = section.id
      else
        redirect_to root_path
      end
    end
    @document = Document.new(new_document_params)
    if @document.save
      redirect_to document_path(@document.id)
    else
      render :new
    end
  end

  def edit
    @document = Document.find(params[:id])
    return redirect_to document_path unless @document.user_id == current_user.id
  end

  def update
    edit_document_params = document_params
    if section_params[:section_name] != ""
      section = Section.new(section_params)
      # section.participate_users << current_user
      if section.save
        edit_document_params[:section_id] = section.id
      else
        redirect_to root_path
      end
    end
    @document = Document.find(params[:id])
    if @document.update(edit_document_params)
      redirect_to document_path(@document.id)
    else
      render :edit
    end
  end

  def show
    @document = Document.find(params[:id])
    return redirect_to root_path if @document.section.participate_users.where(id: current_user.id).blank?
    @comments = @document.comments
    @comment = Comment.new
  end

  def destroy
    @document = Document.find(params[:id])
    return redirect_to document_path unless @document.user_id == current_user.id
    if @document.destroy
      redirect_to root_path
    else
      flash.now[:alert] = "文書情報を削除できませんでした。"
      render :show
    end
  end

  private
  def document_params
    params.require(:document).permit(:title, :src, :note, :section_id).merge(user_id: current_user.id)
  end

  def section_params
    params.require(:document).permit(:section_name).merge(user_id: current_user.id, disclosure: 0)
  end

  def move_to_user_registration
    redirect_to new_user_registration_path unless user_signed_in?
  end

  def set_owner_sections
    return @owner_sections = [] unless user_signed_in?
    @owner_sections = current_user.sections
  end
end
