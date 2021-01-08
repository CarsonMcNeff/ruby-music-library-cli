class Song 
    attr_accessor :name, :artist, :genre
    @@all = []

    def initialize(name,artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end

    def save 
        @@all << self
    end

    def self.all 
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        song = Song.new(name)
        song.save
        song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre 
        genre.add_song(self) if !genre.songs.include?(self)
    end

    def self.find_by_name(name)
        @@all.detect{|song|song.name == name}
    end

    def self.find_or_create_by_name(name)
        found = find_by_name(name) 
        found ? found : create(name)
    end

    def self.new_from_filename(filename)
        info = filename.split(" - ")
        artist = Artist.find_or_create_by_name(info[0])
        genre = Genre.find_or_create_by_name(info[2].chomp(".mp3"))
        Song.new(info[1],artist,genre)
    end

    def self.create_from_filename(filename)
        new_from_filename(filename).save
    end
end