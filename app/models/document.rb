class Document < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :section, optional: true
  belongs_to :user

  validates :title, :src, :section_id, presence: true
  
  def self.search(search)
    search = "%#{search}%"
    return Document.find_by_sql(["select * from documents where title like ? or note like ?", search, search])
  end

  # def self.search(search)
  #   return Document.all unless search
  #   search = "%#{search}%"
  #   Document.find_by_sql(["select * from documents where title like ? or note like ?", search, search])
  # end
end
