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
    song_info = filename.split(" - ")
    new_song = Song.new(song_info[1])
    new_song.artist_name = song_info[0]
    new_song
  end
  
  def artist=(artist)
    @artist = artist
    artist.songs << self unless artist.songs.include?(self)
  end
  
  def artist_name=(artist_name)
    
    self.artist = Artist.find_or_create_by_name(artist_name)
    
  end
    
    # found_artist = false
    # Artist.@@all.each do |current_artist|
    #   if(current_artist.name == artist)
    #     found_artist = true
    #     self.artist = current_artist
    #   end
    # end
    # if(!found_artist)
    #   new_artist = Artist.new(artist)
    #   self.artist = new_artist
    # end
    # artist.songs << self

  
end