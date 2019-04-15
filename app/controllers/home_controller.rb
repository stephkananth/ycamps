class HomeController < ApplicationController
  def index
    @current_camps = Camp.all.current.alphabetical
  end
end
