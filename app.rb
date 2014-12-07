require 'sinatra'
require 'sinatra/reloader'
require 'padrino-helpers'
require 'dotenv'
require_relative './services/gnavi/api'

class App < Sinatra::Application
  register ::Padrino::Rendering
  configure :production do
    Dotenv.load
  end

  configure :development do
    register Sinatra::Reloader
    Dotenv.load
  end

  get '/' do
    page = params[:page].nil? ? 1 : params[:page].to_i
    result = Services::Gnavi::Api.search(freeword: 'サッポロラガー', page: page)
    slim :index, locals: {result: result, title: 'Title'}, layout: :layout
  end

  get '/api/point' do
    headers["Access-Control-Allow-Origin"] = "*"
    Services::Gnavi::Api.point(params)
  end

  get '/api/point/1' do
    Services::Gnavi::Api.point_once(params)
  end
end
