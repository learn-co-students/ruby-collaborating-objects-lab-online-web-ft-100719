class Song 
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    self.name = name
    @@all << self
  end 

  def self.all 
    @@all
  end 

  def self.new_by_filename(file)
    song = file.split(" - ")
    new_song = Song.new(song[1])
    new_song.artist_name=(song[0])
    new_song
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
  end 

end 