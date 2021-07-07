require 'pry'
class MP3Importer
  attr_accessor :path
  
  
  
  def initialize(path)
    @path = path
  end
  
  def files
    
    Dir.entries(path).select{|file| file.include?("mp3")} 
      # returns them in an array
  end 
  
  def import 
    files.each{|file_name| Song.new_by_filename(file_name)} 
      # turns them into a song
  end
  
end

