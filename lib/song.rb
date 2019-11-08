require 'pry'

class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1]
    new_song = Song.new(name)
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song
  end

  def artist_name=(artist_string)
    self.artist = Artist.find_or_create_by_name(artist_string)
  end

end
