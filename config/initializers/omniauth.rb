require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV["spot_key"], ENV["spot_secret"], scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end
