class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :company
      t.string :listingDate
      t.string :contact
      t.string :activities
      t.string :price
      t.string :shareType
      t.string :code
      t.string :capital
      t.string :close
      t.string :underwriter

      t.timestamps
    end
  end
end
