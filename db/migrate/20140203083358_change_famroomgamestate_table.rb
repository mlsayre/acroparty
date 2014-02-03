class ChangeFamroomgamestateTable < ActiveRecord::Migration
  def change
    rename_table :famroomgamestate, :famroomgamestates
  end
end
