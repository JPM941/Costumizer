class CreateCostumes < ActiveRecord::Migration[7.0]
  def change
    create_table :costumes do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.boolean :available
      t.integer :costume_rating
      t.text :costume_review
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
