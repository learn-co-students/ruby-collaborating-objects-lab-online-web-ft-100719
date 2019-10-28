class MP3Importer

  attr_reader :path

    def initialize(path)
      @path = path
    end

    def files
      @files = Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
    end

    def import
      self.files.each{|file| Song.new_by_filename(file)}
    end
end


class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    song_name = file.split(" - ")[1]
    artist = file.split(" - ")[0]
    song = self.new(song_name)
     song.artist_name = artist
    song
  end
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    