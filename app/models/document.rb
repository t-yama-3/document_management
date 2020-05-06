class Document < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :section, optional: true
end
