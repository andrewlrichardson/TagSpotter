class UsersController < ApplicationController
  def spotify
    spot_user = RSpotify::User.new(request.env['omniauth.auth'])
    puts spot_user.to_yaml
    @songs = get_all_saved_tracks(spot_user)

    # redirect_to root_path
  end

  private

    def get_all_saved_tracks(user)
      puts "begin function"
      songs = []
      size = 25
      offset = 0
      while size == 25 do
        puts 'started while loop'
        current_songs = user.saved_tracks(limit: 25, offset: offset)
        songs = songs + current_songs
        offset = offset + 25
        puts "size = #{current_songs.size}"
        size = current_songs.size
      end
      return songs
    end

end
