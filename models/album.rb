require ( 'pg' )
require_relative( '../db/sql_runner.rb' )
require_relative( 'artist.rb' )

class Album
  attr_accessor :album_title, :genre
  attr_reader :id, :artist_id

  def initialize(options)
    @id =  options['id'].to_i if options['id']
    @album_title = options['album_title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end
end
