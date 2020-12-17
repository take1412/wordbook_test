class CreateAuthorities < ActiveRecord::Migration[6.0]
  def change
    create_table :authorities do |t|
      t.integer :authority_user_code,            null: false
      t.references :wordlist,                    null: false, foreign_key: true
            
      t.timestamps
    end
  end
end
