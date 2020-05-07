class UsersController < ApplicationController
  before_action :move_to_user_registration
  before_action :set_sections, only: [:index, :new, :edit]

  def index
  end

  private
  def move_to_user_registration
    redirect_to new_user_registration_path unless user_signed_in?
  end
  
  def set_sections
    @sections = Section.all.includes(:documents)
  end
end
