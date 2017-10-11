require ( 'pg' )
require_relative( '../db/sql_runner.rb' )
require_relative( 'album.rb' )

class Artist
  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name)
           VALUES ($1)
           RETURNING * "
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end


  def self.all()
    sql = "SELECT * FROM artists"
    values = []
    musicians = SqlRunner.run(sql, values)
    artists_as_objects = musicians.map {|artist| Artist.new(artist)}
    return artists_as_objects
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    values = []
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists
           WHERE id = $1 "
    values = [@id]
    SqlRunner.run(sql, values)
  end

  # def update()
  #   sql = "UPDATE artists
  #          SET (name) = ($1)
  #          WHERE id = $2 "
  #   values = [@name, @id]
  #   SqlRunner.run(sql, values)
  # end

  def Artist.find(id_number)
    sql = "SELECT * FROM artists
           WHERE id = $1"
    values = [id_number]
    result = SqlRunner.run(sql, values)
    artist_details = result[0]
    artist_info = Artist.new(artist_details)
    return artist_info
    db.close()
  end

  def find_albums
    sql = "SELECT * FROM albums
           WHERE artist_id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    album_details = result.map{|albums| Album.new(albums)}
    return album_details
  end



end
