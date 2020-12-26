class CreateCateogries < ActiveRecord::Migration[6.0]
  def change
    create_table :cateogries do |t|
      t.string :title

      t.timestamps
    end
  end
end
