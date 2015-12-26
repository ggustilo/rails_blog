class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
    	t.string :title, null: false
    	t.text :content

    	# foreign keys

    	t.integer :writer_id, null: false
    	t.integer :post_id, null: false

      t.timestamps null: false
    end
  end
end
