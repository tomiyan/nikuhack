require 'oj'
require 'faraday'

module Services
module Gnavi
  module Api

    HOST = 'http://api.gnavi.co.jp'
    PATH_SEARCH = '/ver1/RestSearchAPI/'
    KEY_ID = '4b4b7cb1e0439e9ce9069e0ab1b4f947'

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
  end

end
end
