class SectionsController < ApplicationController
  before_action :move_to_user_registration
  before_action :set_owner_sections, except: [:destroy]
  
  def index
    @participation_sections = current_user.participate_sections
  end

  def owner
  end

  def new
    @section = Section.new
    @section.participate_users << current_user
  end

  def create
    # binding.pry
    # parent_section = Section.find(params[:section][:parent_id])
    # @section = parent_section.children.new(section_name: params[:section][:section_name], user_id: current_user.id)
    # if @section.save
    #   redirect_to section_path(@section.id)
    # else
    #   render :new
    # end

    @section = Section.new(section_params)
    if @section.save
      redirect_to section_path(@section.id), notice: '分類を作成しました'
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
      redirect_to section_path(@section.id), notice: '分類を更新しました'
    else
      render :edit
    end
  end

  def show
    @section = Section.find(params[:id])
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

  def new_document
    @document = Document.new(section_id: params[:id])
    render "documents/new"
  end

  private
  def section_params
    params.require(:section).permit(:section_name, :disclosure, :gist, participate_user_ids: []).merge(user_id: current_user.id)
  end
  
  def move_to_user_registration
    return redirect_to new_user_registration_path unless user_signed_in?
  end

  def set_owner_sections
    return @owner_sections = [] unless user_signed_in?
    @owner_sections = current_user.sections
  end
end
