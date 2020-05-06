class AddSectionIdToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :section, foreign_key: true
  end
end
