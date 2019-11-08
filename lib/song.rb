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

  def artist_name
    artist.name if artist
  end
  
  def self.new_by_filename(filename)
    file_array = filename.split(" - ")
    new_song = Song.new(file_array[1])
    new_song.artist_name=(file_array[0])
    new_song
  end
  
  def artist_name=(artist_name)
    Artist.all.each do |artist_find|
      if artist_find.name == artist_name
        artist_find.add_song(self)
        return artist_find
      end
    end
    new_artist = Artist.new(artist_name)
    new_artist.add_song(self)
    new_artist
  end
    
end