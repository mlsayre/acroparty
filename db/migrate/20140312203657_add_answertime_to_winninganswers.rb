class AddAnswertimeToWinninganswers < ActiveRecord::Migration
  def change
    add_column :winninganswers, :answertime, :float, :default => 0.0
  end
end
