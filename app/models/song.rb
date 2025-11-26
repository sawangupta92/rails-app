class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :genre, presence: true
  validates :release_date, presence: true


  def self.ransackable_attributes(auth_object = nil)
    ["artist", "created_at", "duration", "genre", "id", "id_value", "release_date", "title", "updated_at"]
  end
end
