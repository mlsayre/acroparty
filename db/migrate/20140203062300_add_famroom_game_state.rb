class AddFamroomGameState < ActiveRecord::Migration
  create_table :famroomgamestate do |t|
    t.string :activity
    t.integer :round
    t.boolean :inprogress
  end
end
