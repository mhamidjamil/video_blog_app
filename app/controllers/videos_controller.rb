class VideosController < ApplicationController
  require 'google/apis/youtube_v3'
  def index
    client = Google::Apis::YoutubeV3::YouTubeService.new
    client.key = ENV['GOOGLE_API_KEY']

    # Replace CHANNEL_ID with the ID of the user's YouTube channel
    videos = client.list_searches('id,snippet', channel_id: 'CHANNEL_ID', type: 'video', order: 'date', max_results: 10)
    @thumbnails = videos.items.map { |v| v.snippet.thumbnails.medium.url }
  end
end
