class DocumentsController < ApplicationController
  def index
    @groups = Group.all.includes(:documents)
  end

  def new
    @groups = Group.all.includes(:documents)
    @document = Document.new
  end

  def create
  end

  def show
    response.headers['X-Frame-Options'] = 'ALLOWALL'
    @document = Document.find(params[:id])
  end
end
