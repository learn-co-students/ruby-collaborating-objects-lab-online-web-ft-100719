class Artist
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def add_song(song)
    song.artist=self unless song.artist==self
  end
  
  def self.find(name)
    self.all.detect {|artist| artist.name == name}
  end
  
  def self.create(name) 
    artist = self.new(name)
    artist.name = name
    artist
  end
  
  def self.find_or_create_by_name(name)
    self.find(name) || self.create(name)
  end
  
  def print_songs
    Song.all.select do |song| 
      if song.artist == self
        puts song.name
      end
    end
  end
  
end