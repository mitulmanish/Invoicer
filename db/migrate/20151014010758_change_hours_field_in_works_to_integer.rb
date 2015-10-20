class ChangeHoursFieldInWorksToInteger < ActiveRecord::Migration
  def change
  	remove_column :works, :hours
  	add_column :works, :hours, :int
  end
end
