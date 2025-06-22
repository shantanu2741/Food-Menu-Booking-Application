class CreateResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :responses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true
      t.boolean :snacks
      t.boolean :dinner
      t.integer :chapati_count
      t.date :response_date

      t.timestamps
    end
  end
end
