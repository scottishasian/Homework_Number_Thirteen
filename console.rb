require ( 'pry' )
require_relative( 'models/artist.rb' )
require_relative( 'models/album.rb' )

artist_1 = Artist.new({'name' => 'Alt-J'})

artist_2 = Artist.new({'name' => 'Cream'})

album_1 = Album.new(
  {
    'artist_id' => artist_1.id,
    'album_title' => 'An Awesome Wave',
    'genre' => 'Art Rock'
  }
)

album_2 = Album.new(
  {
    'artist_id' => artist_2.id,
    'album_title' => 'Disraeli Gears',
    'genre' => 'Rock'
  }
)


binding.pry
nil
