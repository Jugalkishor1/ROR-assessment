# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  def self.search(query)
    query = query.strip if query
    if query.present?
      where('title ILIKE ? OR body ILIKE ?', "%#{query}%", "%#{query}%")
    else
      all
    end
  end
end
