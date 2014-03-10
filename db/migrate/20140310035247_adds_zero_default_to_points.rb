class AddsZeroDefaultToPoints < ActiveRecord::Migration
  def change
    change_column :famroomanswers, :points, :integer, :default => 0
  end
end
