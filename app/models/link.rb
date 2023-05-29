class Link < ApplicationRecord
  validates :original_url, presence: true
  validates :slug, presence: true

  def shortened_url
    "localhost:3000/#{slug}"
  end
end