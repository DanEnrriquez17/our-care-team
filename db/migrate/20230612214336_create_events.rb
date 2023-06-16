class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :event_type
      t.datetime :start
      t.datetime :end
      t.string :title
      t.text :location
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
