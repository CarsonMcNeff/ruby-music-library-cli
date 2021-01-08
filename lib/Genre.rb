class Genre 
    attr_accessor :name, :songs
    @@all = []

    extend Concerns::Findable

    def initialize(name,songs = [])
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
        genre = Genre.new(name)
        genre.save
        genre
    end

    def songs 
        @songs
    end

    def add_song(song)
        @songs << song
    end

    def artists
        songs.collect{|song|song.artist}.uniq
    end
end