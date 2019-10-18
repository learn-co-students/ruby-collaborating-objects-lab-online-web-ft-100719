class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist=nil)
    @name = name
    @artist = artist
    @@all << self
  end

  def self.all
    @@all
  end

  def artist_name
     self.artist.name
 end

  def artists
    songs.map do |song|
      song.artist
    end
 end

end
