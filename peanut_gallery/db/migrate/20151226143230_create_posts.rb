class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :title, null: false
    	t.text :content
    	t.integer :category, null: false
    	t.text :requests_for_responses
    	t.text :additional_resources

    	# foreign keys
    	t.integer :writer_id, null: false

      t.timestamps null: false
    end
  end
end
