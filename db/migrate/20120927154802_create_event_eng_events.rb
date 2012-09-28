class CreateEventEngEvents < ActiveRecord::Migration
  def change
    create_table :event_eng_events do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end