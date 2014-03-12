class AddPointsalltimeToUser < ActiveRecord::Migration
  def change
    add_column :users, :points_alltime, :integer, :default => 0
  end
end
