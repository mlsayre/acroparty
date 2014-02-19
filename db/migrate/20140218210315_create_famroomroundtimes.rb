class CreateFamroomroundtimes < ActiveRecord::Migration
  def change
    create_table :famroomroundtimes do |t|
      t.datetime :R1Prep
      t.datetime :R1Write
      t.datetime :R1Vote
      t.datetime :R1Res

      t.timestamps
    end
  end
end
