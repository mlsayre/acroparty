class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :dateofbirth, :date
    add_column :users, :location, :string, :default => "Acroparty City"
    add_column :users, :about, :string, :default => "-"
    add_column :users, :avatarurl, :string
    add_column :users, :gamesplayed, :integer, :default => 0
    add_column :users, :gameswon, :integer, :default => 0
    add_column :users, :ignores, :integer, :default => 0
    add_column :users, :boots, :integer, :default => 0
    add_column :users, :highestscore, :integer, :default => 0
  end
end
