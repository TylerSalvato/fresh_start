class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :bidstep
      t.text :category
      t.string :image
      t.references :auction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
