class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :type
      t.datetime :start
      t.datetime :end
      t.string :title
      t.text :location

      t.timestamps
    end
  end
end
