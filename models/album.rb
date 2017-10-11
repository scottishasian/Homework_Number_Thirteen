require ( 'pg' )
require_relative( '../db/sql_runner.rb' )
require_relative( 'artist.rb' )

class Album
  attr_accessor :album_title, :genre
  attr_reader :id, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @album_title = options['album_title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (artist_id, album_title, genre)
           VALUES ($1, $2, $3)
           RETURNING * "
    values = [@artist_id, @genre, @album_title]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    values = []
    SqlRunner.run(sql, values)
  end

end
