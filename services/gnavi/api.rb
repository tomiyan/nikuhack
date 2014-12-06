require 'oj'
require 'faraday'
require 'yajl'

module Services
module Gnavi
  module Api

    HOST = 'http://api.gnavi.co.jp'
    PATH_SEARCH = '/ver1/RestSearchAPI/'

    def self.search(params = {})
      freeword = params[:freeword]
      page = params[:page]

      api_params = {
        keyid: KEY_ID,
        format: 'json',
        freeword: freeword,
        offset_page: page,
      }
      conn = ::Faraday.new(url: HOST) do | builder |
        builder.request :url_encoded
        builder.response :logger
        builder.adapter Faraday.default_adapter
      end
      response = conn.get PATH_SEARCH, api_params
      Oj.load(response.body)
    end

    def self.point_once(params = {})
      File.read(File.expand_path('../geo.json', __FILE__), :encoding => Encoding::UTF_8)
    end

    def self.point(params = {})
      path = '../geo.json'
      if params[:id].to_i == 6843910
        path = '../geo2.json'
      end
      File.read(File.expand_path(path, __FILE__), :encoding => Encoding::UTF_8)
    end
  end

end
end
