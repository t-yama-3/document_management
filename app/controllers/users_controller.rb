class UsersController < ApplicationController
  before_action :move_to_user_registration
  before_action :set_owner_sections, only: [:index, :new, :edit]

  def index
  end

  private
  def move_to_user_registration
    redirect_to new_user_registration_path unless user_signed_in?
  end
  
  def set_owner_sections
    return @owner_sections = [] unless user_signed_in?
    @owner_sections = current_user.sections
  end
end
