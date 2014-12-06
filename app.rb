require 'sinatra'
require 'sinatra/reloader'
require 'padrino-helpers'
require_relative './services/gnavi/api'

class App < Sinatra::Application
  register ::Padrino::Rendering
  configure :production do
  end

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    page = params[:page].nil? ? 1 : params[:page].to_i
    result = Services::Gnavi::Api.search(freeword: 'サッポロラガー', page: page)
    slim :index, locals: {result: result, title: 'Title'}, layout: :layout
  end
end
