require ( 'pg' )
require_relative( '../db/sql_runner.rb' )

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



end
