class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.text :description
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
