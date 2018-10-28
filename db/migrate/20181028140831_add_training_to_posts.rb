class AddTrainingToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :training, :text
  end
end
