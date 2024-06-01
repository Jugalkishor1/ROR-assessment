require 'httparty'

class NewsApiService
  include HTTParty
  base_uri 'https://newsapi.org/v2'

  def initialize
    @api_key = ENV['NEWS_API_KEY']
  end

  def top_headlines(country: 'in', category: nil, pageSize: 20, page: 1)
    options = {
      query: {
        country: country,
        category: category,
        pageSize: pageSize,
        page: page,
        apiKey: @api_key
      }
    }
    handle_response(self.class.get('/top-headlines', options))
  end

  private

  def handle_response(response)
    if response.success?
      response.parsed_response
    else
      nil
    end
  end
end
