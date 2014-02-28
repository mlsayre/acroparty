class AddAnswerTable < ActiveRecord::Migration
  def change
    create_table :famroomanswers do |t|
      t.integer :user_id
      t.integer :round
      t.string :answer
      t.datetime :roundstarted
      t.float :answertime
      t.integer :points
      t.boolean :winner, :default => false

      t.timestamps
    end
  end
end
