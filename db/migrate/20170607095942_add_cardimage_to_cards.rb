class AddCardimageToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :cardimage, :string
  end
end
