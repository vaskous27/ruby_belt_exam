class EditUserColumnInEventModel < ActiveRecord::Migration
  def change
  	remove_column(:events, :user_id)
  end
end
