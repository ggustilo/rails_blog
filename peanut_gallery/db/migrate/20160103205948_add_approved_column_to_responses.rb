class AddApprovedColumnToResponses < ActiveRecord::Migration
  def change
  	add_column :responses, :approved, :boolean, default: false
  end
end
