require 'pry'

class Song

  attr_accessor :name, :artist

  @@all=[]

  def initialize(name)
    @name=name
    @@all<<self
  end

  def artist=(artist)
    @artist=artist
    @artist.name=self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    song=Song.new(@filename)
    song.name=filename.split(' - ')[1]
    song.artist=filename.split(' - ')[0]
    # song = self.new
    # song.name = filename.split(" - ")[1]
    # song


    # song=self.new
    # song.name=filename.split(' - ')[1]
    #

    # song.artist=filename.split(' - ')[0]

  end


end
