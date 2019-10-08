require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    # or song.save
    song
  end
  
  def self.new_by_name(song_name)
    song = Song.create
    song.name = song_name
    song
end

def self.create_by_name(song_name)
  self.new_by_name(song_name)
 
end

def self.find_by_name(song_name)
  self.all.find {|song| song.name == song_name}
end
#   @@all.each do |song|
#     if song.name == song_name
#       return song
#     else 
#       @all.find?(song_name)
#     end
#   end

def self.find_or_create_by_name(song_name)
  if self.find_by_name(song_name)
    self.find_by_name(song_name)
else
  self.create_by_name(song_name)
  
end
  
  
  
  
end

def self.alphabetical
  
  @@all.sort_by {|song| song.name}

end

def self.new_from_filename(song)
split_file = song.split(" - ")
 artist = split_file[0]
 song_name = split_file[1].split(".")[0]
  #song_name = split_file[1].gsub(".mp3", "")
  #song = self.new_by_name(song_name)
  #song.artist_name = artist
  
  song = Song.new 
  song.name = song_name 
  song.artist_name = artist 
  song
end

def self.create_from_filename(song)
  song = self.new_from_filename(song)
  song.save
  song
end

def self.destroy_all

self.all.clear

end

end




