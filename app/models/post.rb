# frozen_string_literal: true

# It will validate the presence of title and content
class Post < ApplicationRecord
  belongs_to :user

  validates :title, :content, presence: true
end
