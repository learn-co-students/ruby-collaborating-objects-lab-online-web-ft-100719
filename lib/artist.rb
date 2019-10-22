class Artist
attr_accessor :name, :songs
@@all=[]
    def initialize(name)
        @name=name
        @@all << self
        @songs=[]
    end

    def self.all
        @@all
    end

    def songs
        @songs
    end

    def add_song(song)
        @songs<< song 
        song.artist=self unless song.artist==self
    end
    
    def self.find_or_create_by_name(name)
       if !@@all.detect{|artist| artist.name==name}
        artist=Artist.new(name)
        artist.name=name
        artist
       else
        @@all.detect{|artist| artist.name==name}
       end
    end

    def print_songs
        @songs.each{|song| puts song.name}
    end

end