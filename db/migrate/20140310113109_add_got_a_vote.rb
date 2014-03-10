class AddGotAVote < ActiveRecord::Migration
  def change
    add_column :famroomanswers, :gotvote, :boolean
    add_column :famroomanswers, :playervoted, :boolean
  end
end
