class AddReleaseToWordlists < ActiveRecord::Migration[6.0]
  def change
    add_column :wordlists, :release_id, :integer,   null: false
  end
end
