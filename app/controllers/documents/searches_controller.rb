class Documents::SearchesController < ApplicationController
  def index
    @keyword = params[:keyword]
    @documents = Document.search(@keyword)
  end
end
