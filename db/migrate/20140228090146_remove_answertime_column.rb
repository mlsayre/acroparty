class RemoveAnswertimeColumn < ActiveRecord::Migration
  def change
    remove_column :famroomanswers, :answertime
  end
end
