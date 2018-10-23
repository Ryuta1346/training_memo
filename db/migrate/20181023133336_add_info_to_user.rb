class AddInfoToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :started_at, :date
    add_column :users, :finished_at, :date
    add_column :users, :aim, :string
    add_column :users, :weight, :float
    add_column :users, :body_fat_percentage, :float
  end
end
