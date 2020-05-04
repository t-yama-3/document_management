class DocumentsController < ApplicationController
  def index
    @groups = Group.all.includes(:documents)
  end

  def new
    @document = Document.new
  end

  def create
  end

  def show
    response.headers['X-Frame-Options'] = 'ALLOWALL'
    @document = Document.find(params[:id])
  end
end
