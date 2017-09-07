class HomeController < ApplicationController
  before_action :authenticate_user, only: [:auth_needed]

  def index
  end
end
