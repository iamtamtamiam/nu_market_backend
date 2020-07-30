class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :item
      t.text :description
      t.integer :price
      t.string :condition
      t.string :status
      t.integer :zipcode
      t.text :contact
      t.belongs_to :seller, null: false
      t.belongs_to :buyer

      t.timestamps
    end
  end
end
