class Mp3Importer
  attr_accessor :path, :filename 
  
  def initialize(path="./spec/fixtures/")
    @path = path 
  end #initialize
  def import 
  end #import
  
  def files
  end
  
end # Mp3Importer


Dir.glob("#{@path}*.mp3") 