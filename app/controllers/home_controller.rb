class HomeController < ApplicationController
  def index
    @q = Event.published.ransack(params[:q])
    @published_events = @q.result
    @pagy, @events = pagy(@published_events.order(created_at: :desc))
  end
end
