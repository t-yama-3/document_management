class UsersController < ApplicationController
  before_action :move_to_user_registration
  before_action :set_owner_sections, :set_participation_sections

  def index
    @messages = Message.where(user_id: current_user.id).or(Message.where(receiver_id: current_user.id)).order("created_at DESC").limit(5)
  end

  def received_mail
    @add_class1 = " mainBtn__link--select"
    @messages = Message.where(receiver_id: current_user.id).order('created_at DESC')
    render :mail_index
  end

  def send_mail
    @add_class2 = " mainBtn__link--select"
    @messages = Message.where(user_id: current_user.id).order('created_at DESC')
    render :mail_index
  end

  private
  def move_to_user_registration
    redirect_to new_user_registration_path unless user_signed_in?
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
