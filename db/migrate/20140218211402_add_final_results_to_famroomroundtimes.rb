class AddFinalResultsToFamroomroundtimes < ActiveRecord::Migration
  def change
    add_column :famroomroundtimes, :FinalResults, :datetime
  end
end
