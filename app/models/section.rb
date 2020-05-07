class Section < ApplicationRecord
  has_many :documents
  belongs_to :user

  enum disclosure: [:'参加者のみ公開', :'全体に公開']
end
