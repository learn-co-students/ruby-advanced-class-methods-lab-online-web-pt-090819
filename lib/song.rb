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
    song.save
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
    self.all.find{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
   #found_song = self.find_by_name(song_name)
    #if found_song
      #song_name
   # else
      #self.create_by_name(song_name)
   # end
    #song_name
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end
  
  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(file_format)
    song_array = file_format.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end
  
  def self.create_from_filename(file_format)
    result = self.new_from_filename(file_format)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
