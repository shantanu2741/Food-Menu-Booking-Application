class CreateMenus < ActiveRecord::Migration[8.0]
  def change
    create_table :menus do |t|
      t.text :description
      t.date :menu_date
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
  
end
