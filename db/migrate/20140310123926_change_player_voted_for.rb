class ChangePlayerVotedFor < ActiveRecord::Migration
  def change
    remove_column :users, :playervotedfor
  end
end
