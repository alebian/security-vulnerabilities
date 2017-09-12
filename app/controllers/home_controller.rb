class HomeController < ApplicationController
  before_action :authenticate_user, only: [:auth_needed]

  def index
  end

  def os_injection
    @result = eval(params[:command]).to_s if params[:command]
  end
end
