class MessagesController < ApplicationController
  before_action :move_to_user_registration
  before_action :set_owner_sections, :set_participation_sections
  
  def new
    @friend = Friend.find(params[:friend_id])
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path, notice: 'メッセージを送信しました'
    else
      @friend = Friend.find(params[:friend_id])
      render :new
    end
  end

  def update
    @message = Message.find(params[:id])
    if @message.receiver_id == current_user.id
      @message.read = 1
      if @message.save
        render json: { id: params[:id] }
      else
        render json: { id: 0 }
      end
    else
      render json: { id: 0 }
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private
  def move_to_user_registration
    redirect_to new_user_registration_path unless user_signed_in?
  end

  def message_params
    friend_user_id = Friend.get_friend_user_id(current_user.id, params[:friend_id])
    params.require(:message).permit(:title, :text).merge(user_id: current_user.id, friend_id: params[:friend_id], receiver_id: friend_user_id, read: 0)
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
