class CreateAuctions < ActiveRecord::Migration[7.1]

  def change
    create_table :auctions, primary_key: :acution_id do |t|
      t.string :title
      t.integer :goal
      t.date :startdate
      t.date :enddate
      t.time :starttime
      t.time :endtime
      t.text :description
      t.string :image
      #t.references :auction, null: false, foreign_key: true

      t.timestamps
    end
  end
end

