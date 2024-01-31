class RemoveAuctionIdFromAuctions < ActiveRecord::Migration[7.1]
  def change
    remove_column :auctions, :auction_id, :bigint
  end
end
