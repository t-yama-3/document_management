class Document < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :markings, dependent: :destroy
  belongs_to :section, optional: true
  belongs_to :user

  validates :title, :src, presence: true, length: { maximum: 255 }
  validates :note, length: { maximum: 1000 }
  validates :section_id, :user_id, presence: true
  
  def self.search_origin(search)
    return Document.all unless search
    search = "%#{search}%"
    Document.find_by_sql(["select * from documents where title like ? or note like ?", search, search])
  end

  # ログインしていない場合は[user_id=0]
  def self.search(search, user_id)
    if user_id > 0
      sql = "select distinct documents.* from documents
        inner join sections on documents.section_id = sections.id
        inner join user_sections on sections.id = user_sections.section_id
        inner join users on user_sections.user_id = users.id
        where (sections.disclosure = 1
          or sections.id in(select user_sections.section_id from user_sections where user_sections.user_id = #{user_id})
          or sections.user_id = #{user_id}
          or documents.user_id = #{user_id})
        and (documents.title like '%#{search}%' or documents.note like '%#{search}%' or sections.section_name like '%#{search}%')
        order by documents.created_at desc"
    else
      sql = "select documents.* from documents
        inner join sections on documents.section_id = sections.id
        where sections.disclosure = 1 and (title like '%#{search}%' or note like '%#{search}%')
        order by documents.created_at desc"
    end
    @user_documents = Document.find_by_sql(sql)
  end

  def self.participate(user_id)
    sql = "select distinct documents.* from documents
      inner join sections on documents.section_id = sections.id
      inner join user_sections on sections.id = user_sections.section_id
      inner join users on user_sections.user_id = users.id
      where (sections.id in(select user_sections.section_id from user_sections where user_sections.user_id = #{user_id}))
      order by documents.created_at desc"
    return Document.find_by_sql(sql)
  end

  def self.user_public(user_id)
    sql = "select distinct documents.* from documents
      inner join sections on documents.section_id = sections.id
      inner join user_sections on sections.id = user_sections.section_id
      inner join users on user_sections.user_id = users.id
      where (sections.disclosure = 1 and documents.user_id = #{user_id})
      order by documents.created_at desc"
    return Document.find_by_sql(sql)
  end

  def self.public
    sql = "select documents.* from documents
      inner join sections on documents.section_id = sections.id
      where sections.disclosure = 1
      order by documents.created_at desc"
    return Document.find_by_sql(sql)
  end
end
