require( 'pg' )
require_relative('../db/sql_runner')
require_relative('artist')

class Album

  attr_reader( :id, :name )

  attr_accessor(:artist_id)

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (name, artist_id) VALUES ('#{ @name }', #{ @artist_id }) RETURNING *"
    album = SqlRunner.run( sql ).first
    result = Album.new( album )
    return result
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{ @artist_id }"
    artist = SqlRunner.run( sql )
    result = Artist.new( artist.first )
    return result
  end

  def self.all()
    sql = "SELECT * FROM albums ORDER BY name ASC"
    albums = SqlRunner.run( sql )
    result = albums.map { |s| Album.new( s ) }
    return result
  end

  def self.find(id)

    sql = "SELECT * FROM albums WHERE id = #{id}"

    result = SqlRunner.run(sql)

    album = Album.new(result.first)

    return album

  end

  def self.find_by_artist(artist_id)

    sql = "SELECT * FROM albums WHERE artist_id = #{artist_id} ORDER BY name ASC"

    albums = SqlRunner.run(sql)

   result = albums.map { |s| Album.new( s ) }
   return result


  end

  def self.update(options)

    sql = "UPDATE albums SET name = '#{options['name']}'
          WHERE id = #{options['id']}"

    SqlRunner.run(sql)

  end


  def self.eradicate(id)

    sql = "DELETE FROM albums WHERE id = #{id}"

    SqlRunner.run(sql)

  end

end









