class Documents::SearchesController < ApplicationController
  before_action :set_owner_sections, only: [:index]
  def index
    @sections = Section.all.includes(:documents)
    @keyword = params[:keyword]
    @documents = Document.search(@keyword)
  end

  private
  def set_owner_sections
    return @owner_sections = [] unless user_signed_in?
    @owner_sections = current_user.sections
  end  
end
