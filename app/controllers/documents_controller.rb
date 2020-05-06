class DocumentsController < ApplicationController
  def index
    @sections = Section.all.includes(:documents)
  end

  def new
    @sections = Section.all.includes(:documents)
    @document = Document.new
  end

  def create
    # binding.pry
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

  def show
    response.headers['X-Frame-Options'] = 'ALLOWALL'
    @document = Document.find(params[:id])
  end
  private
  def document_params
    params.require(:document).permit(:title, :src, :note, :section_id)
  end
  def section_params
    params.require(:document).permit(:section_name)
  end
end
