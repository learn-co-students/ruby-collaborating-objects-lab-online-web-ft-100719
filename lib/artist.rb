class Artist
  
  attr_accessor :name
  
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end
 
 def self.all
    @@all
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def self.find_or_create_by_name(name)
    @@all.find{ |artist| artist.name == name } ||=  self.new(name)
  end
  
  # def add_song_by_name(name)
  #   song = Song.new(name)
  #   song.artist = self
  # end
 
  # def self.song_count
  #   Song.all.size
  # end
  
  def songs
    Song.all.select {|song| song.artist == self}
  end
end