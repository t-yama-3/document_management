class SectionsController < ApplicationController
  def show
    @sections = Section.all.includes(:documents)
    @section = Section.find(params[:id])
    @documents = @section.documents
  end
end
