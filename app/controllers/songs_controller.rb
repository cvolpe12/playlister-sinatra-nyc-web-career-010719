class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :song_index
  end

  get '/songs/new' do
    erb :song_new
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :song_show
  end

  post '/songs' do
    # binding.pry
    if Artist.find_by(name: cap_each_word(params["song"]["artist"])) == nil
    #if find_by returns nil, then we create a new artist first
      @artist = Artist.create(name: params["song"]["artist"])
      @song = Song.create(name: params["song"]["name"], artist_id: @artist.id)
    else
    #otherwise, we find the artist instance
    #and then create a new song based on the artist id
      @artist = Artist.find_by(name: cap_each_word(params["song"]["artist"]))
      @song = Song.create(name: params["song"]["name"], artist_id: @artist.id)
    end

    # binding.pry

    params["genres"].each do |genre_id|
      SongGenre.create(song_id: @song.id, genre_id: genre_id.to_i)
    end

    # binding.pry
    puts "Successfully created song."

    # flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end


  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :song_edit
  end

  patch '/songs/:slug' do

    binding.pry
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by(name: cap_each_word(params["song"]["artist"]))

    @song.update(name: params["song"]["name"], artist_id: @artist.id)

    # SongGenre.where(song_id: @song.id).each do |song_genre| #instance
    #   song_genre.update(genre_id: )
    # end

    original_ids = SongGenre.where(song_id: @song.id).map{|sg| sg.genre_id}
    new_ids = params["genres"].map{|g| g.to_i}

    params["genres"].each do |genre|
      SongGenre.where(song_id: @song.id).each do |song_genre| #instance
        puts song_genre.song_id
        song_genre.update(genre_id: genre)
      end
    end

    redirect "/songs/#{@song.slug}"
  end

end #end of SongsController
