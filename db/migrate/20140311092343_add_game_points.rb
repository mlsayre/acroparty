class AddGamePoints < ActiveRecord::Migration
  def change
    add_column :users, :gamepoints, :integer, :default => 0
  end
end
