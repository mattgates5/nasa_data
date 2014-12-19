module NasaData
  # API class for communicating with data.nasa.gov
  class API
    require 'json'
    require 'net/http'

    BASE_URL = 'http://data.nasa.gov/api'

    # check status of API, fail on error
    def initialize
      status = request('')['status'].downcase
      raise NasaData::APIError, 'API not accessible' unless status == 'ok'
    end

    # request data with params
    def request(method, params = {})
      uri = URI("#{BASE_URL}/#{method}")
      uri.query = URI.encode_www_form(params)
      res = fetch(uri)
      JSON.parse res.body
    end

    # get request from URI or follow redirect (recursive)
    def fetch(uri, limit = 10)
      raise 'HTTP redirect too deep' if limit < 1
      #response = Net::HTTP.get_response(uri)
      req = Net::HTTP::Get.new(uri.path, { 'User-Agent' => 'nasa_data' })
      res = Net::HTTP.start(uri.host, uri.port) { |http| http.request(req) }
      case res
      when Net::HTTPSuccess     then res
      when Net::HTTPRedirection
        uri.path = res['location']
        fetch(uri, limit - 1)
      else
        raise NasaData::ResponseException, "API response was #{res.code}"
      end
    end
  end

  # Exception classes for nasa_data
  class ResponseException < StandardError; end
  class APIError < StandardError; end
end


