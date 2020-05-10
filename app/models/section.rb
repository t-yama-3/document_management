class Section < ApplicationRecord
  belongs_to :user
  has_many :documents, dependent: :destroy
  has_many :user_sections, dependent: :destroy
  has_many :participate_users, through: :user_sections, source: :user
  has_ancestry

  validates :section_name, :disclosure, presence: true

  enum disclosure: [:'非公開', :'公開']
end
