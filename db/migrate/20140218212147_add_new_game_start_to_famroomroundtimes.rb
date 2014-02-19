class AddNewGameStartToFamroomroundtimes < ActiveRecord::Migration
  def change
    add_column :famroomroundtimes, :NewGameStarts, :datetime
  end
end
