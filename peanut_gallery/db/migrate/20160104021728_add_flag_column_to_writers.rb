class AddFlagColumnToWriters < ActiveRecord::Migration
  def change
  	add_column :writers, :flagged, :boolean, default: false
  end
end
