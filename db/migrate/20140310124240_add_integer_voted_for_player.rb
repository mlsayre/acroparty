class AddIntegerVotedForPlayer < ActiveRecord::Migration
  def change
    add_column :users, :votedforplayer, :integer, :default => nil
  end
end
