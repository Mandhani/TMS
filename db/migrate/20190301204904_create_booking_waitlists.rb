class CreateBookingWaitlists < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_waitlists do |t|
      t.references :booking, foreign_key: true
      t.references :tour, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
