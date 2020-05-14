class ProfilesController < ApplicationController
  before_action :move_to_user_registration, except: [:show]
  before_action :set_owner_sections, :set_participation_sections, only: [:new, :edit, :show]

  def new
    return redirect_to root_path if current_user.profile.present?
    @profile = Profile.new
  end
  
  def create
    return redirect_to root_path if current_user.profile.present?
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to profile_path(@profile.user_id), notice: 'プロフィールを作成しました'
    else
      @user = User.find(current_user.id)
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
    return redirect_to root_path unless @profile.user_id == current_user.id
  end

  def update
    @profile = Profile.find(params[:id])
    return redirect_to root_path unless @profile.user_id == current_user.id
    if @profile.update(profile_params)
      redirect_to profile_path(@profile.user_id), notice: 'プロフィールを更新しました'
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def move_to_user_registration
    redirect_to new_user_registration_path unless user_signed_in?
  end

  def profile_params
    params.require(:profile).permit(:introduction, :prefecture)
  end
  
  def set_owner_sections
    return @owner_sections = [] unless user_signed_in?
    @owner_sections = current_user.sections.order("created_at DESC").limit(0)
  end

  def set_participation_sections
    return @participation_sections = [] unless user_signed_in?
    @participation_sections = current_user.participate_sections.order("created_at DESC").limit(0)
  end
end
