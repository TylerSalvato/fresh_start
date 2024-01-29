class AddCartReferenceToItems < ActiveRecord::Migration[7.1]
  def change
    add_reference(:items, :cart, foreign_key: true)
  end
end
