class DocumentsController < ApplicationController
  def index
    @groups = Group.all.includes(:documents)
    # @documents = Document.all
  end

  def show
    response.headers['X-Frame-Options'] = 'ALLOWALL'
    @document = Document.find(params[:id])
  end
end
