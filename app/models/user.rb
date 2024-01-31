class User < ApplicationRecord
  # Other model code...

  attr_accessor :unconfirmed_email
  # Remove the following line:
  # validates :unconfirmed_email, presence: true

  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }, if: -> { password.present? }
end
