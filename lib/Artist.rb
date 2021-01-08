class Artist
    attr_accessor :name, :songs
    @@all = []

    extend Concerns::Findable
    
    def initialize(name, songs = [])
        @name = name
        @songs = songs
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
        artist = Artist.new(name)
        artist.save
        artist
    end

    def add_song(song)
        song.artist = self if song.artist == nil
        @songs << song if !@songs.include?(song) 
    end

    def genres
        songs.collect{ |song| song.genre}.uniq
    end

    def songs 
        @songs
    end
end