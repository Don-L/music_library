require_relative( './models/album' )
require_relative( './models/artist' )

require( 'pry-byebug' )

artist1 = Artist.new( { 'name' => 'Oasis' } ).save();
artist2 = Artist.new( { 'name' => 'Royal Trux' } ).save();
artist3 = Artist.new( { 'name' => 'Boards of Canada' } ).save();
artist4 = Artist.new( { 'name' => 'Poison the Well' } ).save();
artist5 = Artist.new( { 'name' => 'Squarepusher' } ).save();

album1 = Album.new( { 'name' => 'Roll With It', 'artist_id' => artist1.id } ).save();
album2 = Album.new( { 'name' => 'Another album', 'artist_id' => artist1.id } ).save();
album3 = Album.new( { 'name' => 'Accelerator', 'artist_id' => artist2.id } ).save();
album4 = Album.new( { 'name' => 'Thank You', 'artist_id' => artist2.id } ).save();
album5 = Album.new( { 'name' => 'Geogaddi', 'artist_id' => artist3.id } ).save();
album6 = Album.new( { 'name' => 'Music Has the Right to Children', 'artist_id' => artist3.id } ).save();
album7 = Album.new( { 'name' => 'Tears From the Red', 'artist_id' => artist4.id } ).save();
album8 = Album.new( { 'name' => 'The Opposite of December', 'artist_id' => artist4.id } ).save();
album9 = Album.new( { 'name' => 'Go Plastic', 'artist_id' => artist5.id } ).save();
album10 = Album.new( { 'name' => 'Ultravisitor', 'artist_id' => artist5.id } ).save();


# binding.pry
# nil
