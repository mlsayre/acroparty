class AddAcrolettersAndCategory < ActiveRecord::Migration
  def change
    add_column :famroomanswers, :category, :string
    add_column :famroomanswers, :acroletters, :string
  end
end
