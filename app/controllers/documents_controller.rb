class DocumentsController < ApplicationController
  before_action :move_to_user_registration, except: [:index, :show]
  before_action :set_sections, only: [:index, :new, :edit]
  
  def index
  end

  def new
    @document = Document.new
  end

  def create
    new_document_params = document_params
    if section_params[:section_name] != ""
      section = Section.new(section_params)
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
  end

  def update
    edit_document_params = document_params
    if section_params[:section_name] != ""
      section = Section.new(section_params)
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
    # response.headers['X-Frame-Options'] = 'ALLOWALL'
    # binding.pry
    @document = Document.find(params[:id])
    @comments = @document.comments
    @comment = Comment.new
  end

  def destroy
    @document = Document.find(params[:id])
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

  def set_sections
    @sections = Section.all.includes(:documents)
  end
end
