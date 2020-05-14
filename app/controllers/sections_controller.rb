class SectionsController < ApplicationController
  before_action :move_to_user_registration
  before_action :set_owner_sections, except: [:owner, :destroy]
  before_action :set_participation_sections, except: [:index, :destroy]
  
  # 参加サイト一覧の表示
  def index
    @participation_sections = current_user.participate_sections.order("created_at DESC")
  end

  # 管理サイト一覧の表示
  def owner
    @owner_sections = current_user.sections.order("created_at DESC")
  end

  def new
    @section = Section.new
    @section.participate_users << current_user
  end

  def create
    @section = Section.new(section_params)
    @section.user_id = current_user.id
    if @section.save
      redirect_to section_path(@section.id), notice: '分類を作成しました'
    else
      render :new
    end
  end

  # 編集権は作成者（管理者）のみ
  def edit
    @section = Section.find(params[:id])
    redirect_to section_path(params[:id]) unless @section.user_id == current_user.id
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(section_params)
      redirect_to section_path(@section.id), notice: '分類を更新しました'
    else
      render :edit
    end
  end

  # 閲覧権（グループ参加者、グループ作成者、公開設定の場合は全員可）
  def show
    @participation_sections = current_user.participate_sections.order("created_at DESC")
    @owner_sections = current_user.sections.order("created_at DESC")
    @section = Section.find(params[:id])
    unless @section.disclosure_before_type_cast == 1 || @section.participate_users.where(id: current_user.id).present? || @section.user_id == current_user.id
      return redirect_to root_path
    end
  end

  # 削除権は作成者（管理者）のみ
  def destroy
    @section = Section.find(params[:id])
    return redirect_to section_path(params[:id]) unless @section.user_id == current_user.id
    if @section.destroy
      redirect_to root_path
    else
      flash.now[:alert] = "区分を削除できませんでした。"
      render :show
    end
  end

  # 区分一覧画面から新規document作成
  def new_document
    @document = Document.new(section_id: params[:id])
    render "documents/new"
  end

  private
  def section_params
    params.require(:section).permit(:section_name, :disclosure, :gist, participate_user_ids: [])
  end
  
  def move_to_user_registration
    return redirect_to new_user_registration_path unless user_signed_in?
  end

  # def move_to_root_path(section)
  #   if section.where(section.id: current_user.participate_sections.ids)
  # end

  def set_owner_sections
    return @owner_sections = [] unless user_signed_in?
    @owner_sections = current_user.sections.order("created_at DESC").limit(0)
  end
  
  def set_participation_sections
    return @participation_sections = [] unless user_signed_in?
    @participation_sections = current_user.participate_sections.order("created_at DESC").limit(0)
  end

end
