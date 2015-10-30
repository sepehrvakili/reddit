class AddUserIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :integer
	  Comment.find_each do |c|
	  	c.update(user_id: 1)
	  end
	  change_column :comments, :user_id, :integer, null: false
	end
end
