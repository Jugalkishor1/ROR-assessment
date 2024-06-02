# frozen_string_literal: true

class NewsController < ApplicationController
  def index
    news_service = NewsApiService.new
    @top_headlines = news_service.top_headlines(country: 'us')

    return unless @top_headlines.nil?

    flash[:error] = 'Failed to fetch news. Please try again later.'
  end
end
