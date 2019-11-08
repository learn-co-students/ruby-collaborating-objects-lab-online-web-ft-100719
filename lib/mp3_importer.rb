require 'pry'

class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{@path}/**/*.mp3"].map { |filename| File.basename(filename) }
  end

  def import
    files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end
