class Documents::SearchesController < ApplicationController
  before_action :set_owner_sections, :set_participation_sections, only: [:index]
  
  # def index
  #   @keyword = params[:keyword]
  #   @user_documents = Document.search(@keyword)
  # end

  # def index
  #   # 検索は効いていないが、必要情報の抽出はできた状態（）
  #   @keyword = params[:keyword]
  #   public_documents = Document.joins(:section).where('sections.disclosure = ?', 1)
  #   participate_documents = Document.joins(:section).where('sections.id': current_user.participate_sections.ids)
  #   users_section_documents = Document.joins(:section).where('sections.user_id = ?', current_user.id)
  #   users_documents = Document.where('user_id = ?', current_user.id)
  #   @user_documents = (public_documents + participate_documents + users_section_documents + users_documents).uniq
  # end

  # 検索対象は[公開区分 + 参加区分 + 作成区分 + 作成文書]となる(left joinで結合すればdistinctは不要かもしれない)
  # def index
  #   @keyword = params[:keyword]
  #   search = "%#{@keyword}%"
  #   if user_signed_in?
  #     sql = "select distinct documents.* from documents
  #       inner join sections on documents.section_id = sections.id
  #       inner join user_sections on sections.id = user_sections.section_id
  #       inner join users on user_sections.user_id = users.id
  #       where (sections.disclosure = 1
  #         or sections.id in(select user_sections.section_id from user_sections where user_sections.user_id = #{current_user.id})
  #         or sections.user_id = #{current_user.id}
  #         or documents.user_id = #{current_user.id})
  #       and (documents.title like '#{search}' or documents.note like '#{search}')
  #       order by documents.created_at desc"
  #     @user_documents = Document.find_by_sql(sql)
  #   else
  #     @user_documents = Document
  #       .find_by_sql(["select documents.* from documents inner join sections on documents.section_id = sections.id where sections.disclosure = 1 and (title like ? or note like ?) order by documents.created_at desc", search, search])
  #   end
  # end

  def index
    @keyword = params[:keyword]
    if user_signed_in?
      user_id = current_user.id
    else
      user_id = 0
    end
    @user_documents = Document.search(@keyword, user_id)
    # if user_signed_in?
    #   sql = "select distinct documents.* from documents
    #     inner join sections on documents.section_id = sections.id
    #     inner join user_sections on sections.id = user_sections.section_id
    #     inner join users on user_sections.user_id = users.id
    #     where (sections.disclosure = 1
    #       or sections.id in(select user_sections.section_id from user_sections where user_sections.user_id = #{current_user.id})
    #       or sections.user_id = #{current_user.id}
    #       or documents.user_id = #{current_user.id})
    #     and (documents.title like '#{search}' or documents.note like '#{search}')
    #     order by documents.created_at desc"
    #   @user_documents = Document.find_by_sql(sql)
    # else
    #   @user_documents = Document
    #     .find_by_sql(["select documents.* from documents inner join sections on documents.section_id = sections.id where sections.disclosure = 1 and (title like ? or note like ?) order by documents.created_at desc", search, search])
    # end
  end

  private
  def set_owner_sections
    return @owner_sections = [] unless user_signed_in?
    @owner_sections = current_user.sections.limit(0)
  end

  def set_participation_sections
    return @participation_sections = [] unless user_signed_in?
    @participation_sections = current_user.participate_sections.order("created_at DESC").limit(0)
  end
end
