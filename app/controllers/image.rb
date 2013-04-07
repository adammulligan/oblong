Oblong.controllers :image do
  disable :layout

  get "/", :with => :page, :provides => [:png] do
    script = "#{Padrino.root}/lib/screenshot.coffee"
    image  = "#{Padrino.root}/public/images/screenshots/#{params[:page]}.png"
    `phantomjs #{script} #{url("/")}/#{params[:page]} #{image}`

    send_file(image)
  end
end
