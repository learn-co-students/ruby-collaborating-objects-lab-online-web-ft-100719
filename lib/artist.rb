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
  
  def songs
    Song.all.select { |songs| songs.artist == self }
  end
  
  def add_song(song)
    song.artist = self
  end
  
  def self.find_or_create_by_name(given_name)
    if @@all.detect{|artist| artist.name == given_name}
      @@all.detect{|artist| artist.name == given_name}
    else
       artist = Artist.new(given_name)
    end
  end
  
  def print_songs
    puts songs.map {|song_obj| song_obj.name }
  end
  
end