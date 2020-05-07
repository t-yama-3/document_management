class Documents::SearchesController < ApplicationController
  def index
    @sections = Section.all.includes(:documents)
    @keyword = params[:keyword]
    @documents = Document.search(@keyword)
  end
end
