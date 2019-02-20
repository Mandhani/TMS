class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :name
      t.text :description
      t.float :price
      t.datetime :booking_deadline
      t.datetime :duration_start
      t.datetime :duration_end
      t.string :start_location
      t.text :itenary
      t.string :contact
      t.integer :seats
      t.string :status
      t.integer :waitlist

      t.timestamps
    end
  end
end
