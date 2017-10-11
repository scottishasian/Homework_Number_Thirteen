require ( 'pry' )
require_relative( 'models/artist.rb' )

artist_1 = Artist.new({'name' => 'Alt-J'})

artist_2 = Artist.new({'name' => 'Cream'})


binding.pry
nil
