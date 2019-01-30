class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.split(" ").join("-").downcase
  end

  def self.find_by_slug(slug)
    name = slug.split("-").map do |word|
      word.capitalize
    end.join(" ")
    self.find_by(name: name)
  end
  
end
