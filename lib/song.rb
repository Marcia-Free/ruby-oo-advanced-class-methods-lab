require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []


  def save
    self.class.all << self
  end


  def initialize
    @name = name
    @artist_name = artist_name
  end


  def self.create
    song = Song.new
    song.save
    song
  end


  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end


  def self.create_by_name(name)
    song = new_by_name(name)
    song.save
    song
  end


  def self.find_by_name(name)
    all.find { |song|
      name == song.name
    } 
  end


  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)

    # if !find_by_name(song_name)
    #   song = create_by_name(song_name)
    #   song
    # else
    #   song = find_by_name(song_name)
    #   song
    # end
  end


  def self.alphabetical
    all.sort_by! { |song|
      song.name.chars.first
    }
  end


  def self.new_from_filename(file_name)
    #Thundercat - For Love I Come.mp3
    seperated_file_name = file_name.split(" - ")
    artist = seperated_file_name[0].split
    song_name = seperated_file_name[1].split(".mp3")

    song = Song.new
    song.name =  song_name[0]
    song.artist_name = artist[0]
    song
  end


  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end


  def self.all
    @@all
  end


  def self.destroy_all
      all.clear
  end
  
end
