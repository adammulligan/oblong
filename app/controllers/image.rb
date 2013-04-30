Oblong.controllers :image do
  disable :layout

  get "/", :with => :page, :provides => [:png] do
    script = "#{Padrino.root}/lib/screenshot.coffee"
    image  = "#{Padrino.root}/public/images/screenshots/#{params[:page]}.png"
    crushed_image  = "#{Padrino.root}/public/images/screenshots/#{params[:page]}_crushed.png"

    `phantomjs #{script} #{url("/")}/#{params[:page]} #{image}`
    `pngcrush -c 0 #{image} #{crushed_image}`

    send_file(crushed_image)
  end
end
