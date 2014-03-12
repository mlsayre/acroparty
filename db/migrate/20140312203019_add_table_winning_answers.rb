class AddTableWinningAnswers < ActiveRecord::Migration
  def change
    create_table :winninganswers do |t|
      t.integer :user_id
      t.string :answer
      t.integer :points, :default => 0
      t.string :category
      t.string :acroletters

      t.timestamps
    end
  end
end
