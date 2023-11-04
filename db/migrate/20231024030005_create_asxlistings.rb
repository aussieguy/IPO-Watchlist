class CreateAsxlistings < ActiveRecord::Migration[7.0]
  def change
    create_table :asxlistings do |t|
      t.string :code
      t.string :company
      t.string :date
      t.string :listingPrice
      t.string :currentPrice

      t.timestamps
    end
  end
end
