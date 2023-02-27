class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :costume, null: false, foreign_key: true
      t.text :client_review
      t.text :costume_review
      t.date :start_date
      t.date :end_date
      t.string :status
      t.integer :costume_rating
      t.integer :client_rating

      t.timestamps
    end
  end
end
