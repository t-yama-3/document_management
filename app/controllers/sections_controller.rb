class SectionsController < ApplicationController
  before_action :set_sections, only: [:new, :edit]
  
  def new
    # @sections = Section.all.includes(:documents)
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      redirect_to section_path(@section.id)
    else
      render :new
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(section_params)
      redirect_to section_path(@section.id)
    else
      render :edit
    end
  end

  def show
    @sections = Section.all.includes(:documents)
    @section = Section.find(params[:id])
    @documents = @section.documents
  end

  private
  def section_params
    params.require(:section).permit(:section_name, :disclosure).merge(user_id: current_user.id)
  end

  def set_sections
    @sections = Section.all.includes(:documents)
  end
end
