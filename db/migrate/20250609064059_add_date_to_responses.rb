class AddDateToResponses < ActiveRecord::Migration[8.0]
  def change
    add_column :responses, :date, :date
  end
end
