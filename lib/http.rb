require 'faraday'

class Http

    def initialize(url, options = {})
        @connection = Faraday.new(
            url,
            options
        ) 
    end

    def get(url, params={})
        res = @connection.get(url, params)
        return response_builder(res)
    end

    def post(url, body)
        res = @connection.post(url, body)
        return response_builder(res)
    end

    def put(url, body)
        res = @connection.put(url, body)
        return response_builder(res)
    end

    def delete(url)
        res = @connection.delete(url)
        return response_builder(res)
    end

    private
    def response_builder(res)
        return res.status, res.headers.to_hash, JSON.load(res.body)
    end

end
