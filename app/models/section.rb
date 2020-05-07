class Section < ApplicationRecord
  belongs_to :user
  has_many :documents
  has_many :user_sections
  has_many :participate_users, through: :user_sections, source: :user

  enum disclosure: [:'参加者のみ公開', :'全体に公開']
end
