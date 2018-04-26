class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = set_song
  end


  def new
    @song = Song.new
  end


  def edit
    @song = set_song
  end


  def create
    @song = Song.new(song_params)
      if @song.save
        redirect_to song_path(@song)
      else
        render :new
      end
  end


  def update
    @song = set_song
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_url
  end



private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

 def set_song
   @song = Song.find(params[:id])
 end



end