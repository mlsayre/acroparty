class AddPlayerVotedfor < ActiveRecord::Migration
  def change
    remove_column :famroomanswers, :playervoted
    add_column :users, :playervotedfor, :string, :default => nil
  end
end
