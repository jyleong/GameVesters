class LeaderboardsController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def show
    @leaders = sort_by_percent_increase

    respond_to do |format|
      format.html do
        paginate
      end
      format.json do
        render json: @leaders
      end
    end
  end

  private

  def sort_by_percent_increase
    sorted_users = User.order('percent_increase desc').pluck(:name, :percent_increase)
  end
end
