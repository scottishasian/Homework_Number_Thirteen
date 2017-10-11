require ( 'pry' )
require_relative( 'models/artist.rb' )
require_relative( 'models/album.rb' )

Album.delete_all()
Artist.delete_all()

artist_1 = Artist.new({'name' => 'Alt-J'})
artist_1.save()

album_1 = Album.new(
  {
    'artist_id' => artist_1.id,
    'album_title' => 'An Awesome Wave',
    'genre' => 'Art Rock'
  }
)


artist_2 = Artist.new({'name' => 'Cream'})
artist_2.save()

album_2 = Album.new(
  {
    'artist_id' => artist_2.id,
    'album_title' => 'Disraeli Gears',
    'genre' => 'Rock'
  }
)

album_3 = Album.new(
  {
    'artist_id' => artist_2.id,
    'album_title' => 'Goodbye',
    'genre' => 'Rock'
  }
)

album_1.save()


binding.pry
nil
