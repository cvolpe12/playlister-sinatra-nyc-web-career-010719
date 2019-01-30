class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :song_index
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :song_show
  end

  

end
