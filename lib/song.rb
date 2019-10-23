class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def artist=(artist)
        @artist = artist
        artist.songs << self unless artist.songs.include?(self)
    end

    def self.new_by_filename(file_name)
        song_info=file_name.split(" - ")
        song_name=song_info[1]
        artist_name=song_info[0]
        song_genre=song_info[2].delete_suffix(".mp3")
        song=Song.new(song_name)
        song.artist_name=(artist_name)
        song
        
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
    end
    
    
end