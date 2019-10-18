class MP3Importer
  attr_accessor :path, :filename 
  
  #path ="./spec/fixtures/mp3s")
  def initialize(path)
    @path = path 
  end #initialize
  
  def import 
    self.files.each do |filename|
      file = filename.gsub(/.mp3$/, '')
      Song.new_by_filename(file)
    end
  end #import
  
  def files
    files = []
    
    Dir.glob(@path + '/*.mp3').each do |f|
      files << f.split("/").last
    end #each
   
    files

  end #files
  
end # Mp3Importer


