class Marking < ApplicationRecord
  belongs_to :document
  belongs_to :user
  
  validates :user_id, :document_id, presence: true
end
