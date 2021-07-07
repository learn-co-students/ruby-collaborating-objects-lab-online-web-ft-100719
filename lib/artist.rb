class Artist
  attr_accessor :name 
  @@all=[]
end 

def initialize(name)
  @name = name
  @all << self
end 

def self.all
  @@all 
end 

def add_song(song)
  song.artist = self
end 

def songs (song)
  song_array = []
  Song.all.each do |song| 
  if song.artist == self
    song_array << song
  end 
end 
song_array
end
def self.find_or_create_by_name(name)
    self.all.each do |artist|
      if artist.name == name
        return artist
      end
    end
    new_artist = Artist.new(name)
    new_artist
  end 

  def print_songs
    songs.each do |song|
      puts song.name 
    end 
  end
end
  



  
