class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.split(" ").join("-").downcase
  end

  def self.find_by_slug(slug)
    name = slug.split("-").map do |word|
      word.capitalize
    end.join(" ")
    self.find_by(name: name)

    # name = slug.split("-").join(" ")
    #
    # self.all.map do |artist|
    #   artist.name.downcase
    # end.find_by(name: name)
    #
  end

end #end of class
