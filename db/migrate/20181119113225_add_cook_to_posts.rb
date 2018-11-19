class AddCookToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :morning, :text
    add_column :posts, :lunch, :text
    add_column :posts, :dinner, :text
    add_column :posts, :snack, :text
  end
end
