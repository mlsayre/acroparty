class CreateFamroomcats < ActiveRecord::Migration
  def change
    create_table :famroomcats do |t|
      t.string :r1cat
      t.string :r2cat
      t.string :r3cat
      t.string :r4cat
      t.string :r5cat
      t.string :r6cat
      t.string :r7cat
      t.string :r8cat
      t.string :r9cat
      t.string :r10cat

      t.timestamps
    end
  end
end
