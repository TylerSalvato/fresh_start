class RemoveCartIdFromAuctions < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :cart_id, :bigint
  end
end
