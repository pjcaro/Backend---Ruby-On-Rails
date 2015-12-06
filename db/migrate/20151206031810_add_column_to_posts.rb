class AddColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :costo, :decimal, precision: 8, scale: 2
  end
end
