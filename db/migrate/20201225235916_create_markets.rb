class CreateMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :markets do |t|
      t.string :location
      t.string :type
      t.string :season
      t.integer :number_of_vendors

      t.timestamps
    end
  end
end
