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
    render 'dashboard/index'
  end
end
