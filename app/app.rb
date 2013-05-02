class Oblong < Padrino::Application
  register ScssInitializer
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers

  enable :sessions

  def get_current_track
    require 'lastfm'
    lastfm = Lastfm.new(Oblong.lastfm_api_key, Oblong.lastfm_api_secret)

    return lastfm.user.get_recent_tracks('amulligan').first
  end

  get "/index" do
    @lastfm_track = get_current_track
    @lastfm_track["name"] = "#{@lastfm_track["name"][0,28]}.." if @lastfm_track["name"].length > 28
    @lastfm_track["image"] = @lastfm_track["image"][2]["content"]
    @lastfm_track["artist"] = @lastfm_track["artist"]["content"]

    #wunderground_url = "http://api.wunderground.com/api/#{Oblong.wunderground_api_key}/conditions/q/52.2140,0.1257.json"
    #@wunderground_response = open(wunderground_url) { |f| f.read }
    #@current_weather = @wunderground_response['current_observation']
    @current_weather = {"temp_c" => "10.6", "feelslike_c" => "10.6", "forecast_url" => "http://icons-ak.wxug.com/i/c/k/nt_clear.gif"}

    render 'dashboard/index'
  end
end
