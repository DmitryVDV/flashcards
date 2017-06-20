class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :cards, :cardimage, :image
  end
end
