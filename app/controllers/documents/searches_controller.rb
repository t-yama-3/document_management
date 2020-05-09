class Documents::SearchesController < ApplicationController
  before_action :set_owner_sections, only: [:index]
  def index

    # return @user_sections = [] unless user_signed_in?
    # sections = current_user.participate_sections.where.not(user_id: current_user.id) + Section.where(user_id: current_user.id)
    # @user_sections = sections.sort_by!{|ms|ms.created_at}.reverse!

    # @sections = Section.all.includes(:documents)

    @keyword = params[:keyword]
    @user_documents = Document.search(@keyword)
  end

  private
  def set_owner_sections
    return @owner_sections = [] unless user_signed_in?
    @owner_sections = current_user.sections
  end  
end
