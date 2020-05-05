class DocumentsController < ApplicationController
  def index
    @groups = Group.all.includes(:documents)
  end

  def new
    @groups = Group.all.includes(:documents)
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
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
    params.require(:document).permit(:title, :src, :note, :group_id)
  end
end
