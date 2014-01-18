class API < Struct.new(:api_key, :app_id)
  def json(path)
    response = open("#{url}/#{path}", { 'x-api-key' => api_key })
    JSON.parse(response.read)
  end

  def url
    'https://api.newrelic.com/api/v1'
  end
end
