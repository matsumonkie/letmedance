class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description
      t.date :start_at_date, null: false
      t.time :start_at_time
      t.string :image

      t.timestamps
    end
  end
end
