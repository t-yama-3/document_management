class DocumentsController < ApplicationController
  def index
    @groups = Group.all.includes(:documents)
  end

  def new
    @groups = Group.all.includes(:documents)
    @document = Document.new
  end

  def create
    # binding.pry
    new_document_params = document_params
    if group_params[:group_name] != ""
      group = Group.new(group_params)
      if group.save
        new_document_params[:group_id] = group.id
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
    params.require(:document).permit(:title, :src, :note, :group_id)
  end
  def group_params
    params.require(:document).permit(:group_name)
  end
end
