# frozen_string_literal: true

# It will secure password and validate the presence of username, email and password
class User < ApplicationRecord
  has_many :posts

  validates :password, :email, :username, presence: true
end
