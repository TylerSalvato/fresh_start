class CreateAuctions < ActiveRecord::Migration[7.1]

  def change
    create_table :auctions do |t|
      t.string :title
      t.integer :goal
      t.date :startdate
      t.date :enddate
      t.time :starttime
      t.time :endtime
      t.text :description

      t.timestamps
    end
  end
end

