class CreateWordlists < ActiveRecord::Migration[6.0]
  def change
    create_table :wordlists do |t|
      t.string :listname,           null: false
      t.text :text,                 null: false
      t.references :user,           null: false, foreign_key: true
      t.integer :release_id,         null: false
      t.timestamps
    end
  end
end
