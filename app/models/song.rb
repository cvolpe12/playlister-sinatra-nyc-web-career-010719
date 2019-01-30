class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.split(" ").join("-").downcase
  end

  def self.find_by_slug(slug)
<<<<<<< HEAD
    binding.pry
    name = slug.split("-").map do |word|
      word.capitalize
    end.join(" ")
    binding.pry
    self.find_by(name: name)
=======
    self.all.find do |song|
      song.slug == slug
    end
>>>>>>> 4d0357df809a55273644071e81e86fe370a93f59
  end

end
