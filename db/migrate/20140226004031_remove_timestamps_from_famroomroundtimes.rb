class RemoveTimestampsFromFamroomroundtimes < ActiveRecord::Migration
  def up
    remove_column :famroomroundtimes, :created_at
    remove_column :famroomroundtimes, :updated_at
  end

  def down
    add_column :famroomroundtimes, :updated_at, :string
    add_column :famroomroundtimes, :created_at, :string
  end
end
