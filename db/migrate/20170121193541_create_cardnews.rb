class CreateCardnews < ActiveRecord::Migration[5.0]
  def change
    create_table :cardnews do |t|
      t.text :original_text
      t.text :translated
      t.timestamp :review_date

      t.timestamps
    end
  end
end
