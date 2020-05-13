class FriendsController < ApplicationController
  before_action :move_to_user_registration
  before_action :set_owner_sections, only: [:create]

  def create
    # binding.pry
    @friend = Friend.new(user_id: current_user.id, friend_user_id: params[:id], status: 0)
    if @friend.save
      redirect_to profile_path(@friend.friend_user_id), notice: 'フレンド申請を送信しました'
    else
      @user = User.find(params[:id])
      render 'profile/show'
    end
  end

  private
  def move_to_user_registration
    redirect_to new_user_registration_path unless user_signed_in?
  end

  def set_owner_sections
    return @owner_sections = [] unless user_signed_in?
    @owner_sections = current_user.sections.order("created_at DESC").limit(0)
  end
  
end
