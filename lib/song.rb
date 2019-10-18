class Song
  attr_accessor :artist, :name
 
  @@all = []
 
  def initialize(name)
    @name = name
    @@all << self
  end
 
  def self.all
    @@all
  end
  
  def self.artist_name
    @artist ? @artist.name : NIL
  end
  
  def self.artist_name=(name)
    @artist = Artist.find_or_create_by_name(name)
  end
  
  def self.new_by_filename(filename)
    song_details = filename.gsub(/.mp3$/, '').split(" - ")
    song_name = song_details[1]
    new_song = self.new(song_name)
    new_song.artist = Artist.find_or_create_by_name(song_details[0])
    artist_name= song_details[0]
    new_song
  end
  
end