require 'pry'
class Song 
  attr_accessor :name, :artist
  @@all  = []

  def initialize(name)
    @name = name
    @@all << self
  end
  def self.all 
    @@all 
  end
  
  def self.new_by_filename(file) # Michael Jackson - Black or White - pop.mp3
  # need to split artist at "-" and song name at "-"
    artist_name = file.split(" - ")[0] 
    song_name = file.split(" - ")[1]
    # binding.pry
    new_song = self.new(song_name)
    # binding.pry
    new_song.artist_name=artist_name
  # binding.pry
    new_song
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end
end 