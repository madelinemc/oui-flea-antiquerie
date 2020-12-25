class CreateAntiques < ActiveRecord::Migration[6.0]
  def change
    create_table :antiques do |t|
      t.integer :market_id
      t.integer :user_id
      t.integer :category_id
      t.string :photo
      t.string :period
      t.string :provenance
      t.text :description

      t.timestamps
    end
  end
end
