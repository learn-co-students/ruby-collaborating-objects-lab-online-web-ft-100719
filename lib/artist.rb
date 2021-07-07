require 'pry'

class Artist 
  @@all = []
  attr_accessor :name, :songs
  
  def initialize(name)
    # binding.pry
    @name = name
    @songs = []
    @@all << self
  end
  
  def self.all
    @@all 
  end
  
   def songs 
     Song.all.select {|song| song.artist == self} 
  end

  def add_song(song)
    song.artist = self
    @songs << song
  end
  
  def self.find_by(name)
    @@all.find{|artist| artist.name == name}
  end
  
  def self.create_by(name)
    new_artist = self.new(name)
    new_artist.name = name
    new_artist
  end
  
  def self.find_or_create_by_name(name)
    self.find_by(name) || self.create_by(name)
  end
  
  def print_songs 
    self.songs.each{|song| puts song.name}
  end
end