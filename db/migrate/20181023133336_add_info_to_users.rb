class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :started_at, :date
    add_column :users, :finished_at, :date
    add_column :users, :aim, :float
    add_column :users, :weight, :float
    add_column :users, :bmi, :float
  end
end
