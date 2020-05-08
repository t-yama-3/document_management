class SectionsController < ApplicationController
  before_action :move_to_user_registration
  before_action :set_sections, only: [:new, :edit]
  
  def index
    @sections = Section.all.where(user_id: current_user.id)
  end

  def new
    @section = Section.new
  end

  def create
    # parent_section = Section.find(params[:section][:parent_id])
    # @section = parent_section.children.new(section_name: params[:section][:section_name], user_id: current_user.id)
    # if @section.save
    #   redirect_to section_path(@section.id)
    # else
    #   render :new
    # end
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

  def destroy
    @section = Section.find(params[:id])
    if @section.destroy
      redirect_to root_path
    else
      flash.now[:alert] = "区分を削除できませんでした。"
      render :show
    end
  end

  private
  def section_params
    params.require(:section).permit(:section_name, :disclosure).merge(user_id: current_user.id)
  end
  
  def move_to_user_registration
    redirect_to new_user_registration_path unless user_signed_in?
  end

  def set_sections
    @sections = Section.all.includes(:documents)
  end
end
