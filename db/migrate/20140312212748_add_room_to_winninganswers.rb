class AddRoomToWinninganswers < ActiveRecord::Migration
  def change
    add_column :winninganswers, :roomname, :string
  end
end
