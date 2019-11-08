class MP3Importer 
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    all_files = []
    new_all_files = []
    path_string = @path
    Dir.new("#{path_string}").each {|file| all_files << file }
    all_files.each do |file|
      temp_files = []
      temp_files = file.split("/")
      new_all_files << temp_files.last if temp_files.last != ".." && temp_files.last != "."
    end
    new_all_files
  end
  
  def import
    self.files.each do |song|
      Song.all << Song.new_by_filename(song)
    end
  end
  
end
