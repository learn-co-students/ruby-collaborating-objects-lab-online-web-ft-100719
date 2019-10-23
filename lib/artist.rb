class Artist

  attr_accessor :name

  @@all=[]

  def initialize(name)
    @name=name
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    # @@all
    Song.all.select{|song|song.artist==self}
  end

  def add_song(song)
    song.artist=self
  end

  def self.find_or_create_by_name(name)
    if (self.artist.nil?)
      self.artist=Artist.new(name)
    elsif
      self.artist.name=name
    end

  end


end
