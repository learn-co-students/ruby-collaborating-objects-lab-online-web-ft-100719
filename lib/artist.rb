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
  
  def songs 
    Song.all.select do |song|
      song.artist == self
    end
  end
  
  def self.find_or_create_by_name(name)
    artist_names = []
    @@all.each do |artist|
      artist_names << artist.name
    end
    if artist_names.include?(name)
      @@all.each do |artist|
        if artist.name == name
          return artist 
        end
      end
    else 
      new_artist = Artist.new(name)
      new_artist
    end
  end
  
  def print_songs
    Song.all.select do |song|
      puts "#{song.name}" if song.artist == self
    end
  end
  
    
  
  
  
end
