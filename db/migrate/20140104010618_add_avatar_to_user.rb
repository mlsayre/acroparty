class AddAvatarToUser < ActiveRecord::Migration
  def change
    remove_column :users, :avatarurl
    add_attachment :users, :avatar
  end
end
