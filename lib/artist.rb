class Artist 
  
  attr_accessor: :name, :songs 
  
  @@all = [] 
  
  def initialize(name, songs)
    @name = name
    @songs = [] 
  end
  
  def self.all 
    @@all 
  end
  
  def add_song(song)
    @songs << song 
  end
  
  def self.songs
    @@all << self 
  end
  
  def self.find_or_create_by_name(art_name)
    
    found_art = self.all.find {|artist| artist.name == art_name}
    
    if found_art
      found_art
    else
      new_art = self.new(art_name)
      new_art.save
      new_art
    end
  end
  
  def print_songs
    @songs.each do { |song| puts song.name }
  end
  
end