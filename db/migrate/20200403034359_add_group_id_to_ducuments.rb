class AddGroupIdToDucuments < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :group, foreign_key: true
  end
end
