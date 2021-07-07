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
    person = self.new
    person.name = name
    @@all << person
    person
  end

  def self.new_by_name(name)
    person = self.new
    person.name = name
    person
  end

  def self.create_by_name(name)
    person = self.new
    person.name = name
    @@all << person
    person
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
   self.find_by_name(name) ||
   self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name }
  end

  def self.new_from_filename(file_name)
   rows = file_name.split(" - ")
   
    artist_name = rows[0]
    song_name = rows[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
    
  end

  def self.create_from_filename(file_name)
    @@all << self.new_from_filename(file_name)
    
  
  end
  def self.destroy_all
    @@all.clear
  end
end
