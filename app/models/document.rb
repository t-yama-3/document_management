class Document < ApplicationRecord
  belongs_to :group, optional: true
end
