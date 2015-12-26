class CreateWriters < ActiveRecord::Migration
  def change
    create_table :writers do |t|
    	t.string :username, null: false
    	t.string :email, null: false
    	t.string :password_hash, null: false
    	t.text :self_description

      t.timestamps null: false
    end
  end
end
