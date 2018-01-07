class TweetsController < ApplicationController
  before_action :init_client, only: [:search]

  def index
    @search = SearchForm.new
    @tweets = []
  end

  def search
    @search = SearchForm.new(search_params)
    unless @search.valid?
      @tweets = []
      render :index and return
    end
    @tweets = @client.search(@search.query).take(@search.count || 50)
    respond_to do |format|
      format.json do
        render json: @tweets.map(&:to_hash)
      end
      format.html do
        render :index
      end
    end
  end

  private
    def init_client
      @client = ::Twitter::REST::Client.new do |config|
        secrets = Rails.application.secrets.twitter
        config.consumer_key = secrets[:consumer_key]
        config.consumer_secret = secrets[:consumer_secret]
      end
    end

    def search_params
      params.require(:search).permit(:query, :count)
    end
end
