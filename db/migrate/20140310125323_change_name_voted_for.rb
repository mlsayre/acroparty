class ChangeNameVotedFor < ActiveRecord::Migration
  def change
    rename_column :users, :votedforplayer, :answervotedfor
  end
end
