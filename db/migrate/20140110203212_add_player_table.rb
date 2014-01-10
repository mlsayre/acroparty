class AddPlayerTable < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :user_id
      t.string :name
      t.string :room
    end
  end
end
