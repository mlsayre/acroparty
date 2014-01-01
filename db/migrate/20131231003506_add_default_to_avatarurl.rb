class AddDefaultToAvatarurl < ActiveRecord::Migration
  def change
    change_column :users, :avatarurl, :string, :default => "https://s3-us-west-2.amazonaws.com/apavatars/ap_generic_avatar80.png"
  end
end
