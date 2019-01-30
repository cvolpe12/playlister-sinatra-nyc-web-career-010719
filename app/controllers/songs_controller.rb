class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :song_index
  end

  get '/songs/:slug' do
      # binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :song_show
  end



end
