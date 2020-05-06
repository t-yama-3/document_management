class Section < ApplicationRecord
  has_many :documents

  enum disclosure: [:'参加者のみ公開', :'全体に公開']
end
