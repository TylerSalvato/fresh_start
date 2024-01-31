class Item < ApplicationRecord
    belongs_to :auction
    validates :auction, presence: true
    #belongs_to :cart


end