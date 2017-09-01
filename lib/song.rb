class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    @@all << song
    song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    @@all << song
    song
  end

  def self.find_by_name(title)
    self.all.detect {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title) == nil
      self.create_by_name(title)
    else
      self.find_by_name(title)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.split_file_to_name_artist(filename)
    split = filename.split(/[-.]/)
    title = split[1].slice(1..-1)
    artist = split[0].chomp(" ")
    split_hash = {title: title,artist: artist}
  end

  def self.new_from_filename(filename)
    split_hash = split_file_to_name_artist(filename)
    song = new_by_name(split_hash[:title])
    song.artist_name = split_hash[:artist]
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    @@all << song
  end

  def self.destroy_all
    @@all = []
  end

  def save
    self.class.all << self
  end

end
