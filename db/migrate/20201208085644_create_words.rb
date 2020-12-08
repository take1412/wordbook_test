class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
      t.string :wordname,           null: false
      t.text :mean,                 null: false
      t.references :user,           null: false, foreign_key: true
      t.references :wordlist,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
