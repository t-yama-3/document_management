class AddGistToSections < ActiveRecord::Migration[5.2]
  def change
    add_column :sections, :gist, :text
  end
end
