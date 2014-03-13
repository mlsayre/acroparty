class AddGamepointsToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :gamepoints, :integer
  end
end
