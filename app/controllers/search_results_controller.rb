class SearchResultsController < ApplicationController
  def index
    query = params[:query]
    results = PgSearch.multisearch(query)
    @users = []

    results.each do |result|
      profile = Profile.find(result.searchable_id)
      user = User.find(profile.owner_id)
      @users << user
    end

  end

  def new
  end
end
