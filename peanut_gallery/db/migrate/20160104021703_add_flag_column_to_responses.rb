class AddFlagColumnToResponses < ActiveRecord::Migration
  def change
  	add_column :responses, :flagged, :boolean, default: false
  end
end
