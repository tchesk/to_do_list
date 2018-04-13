class HomeController < ApplicationController
  def index
    @task = Task.all
  end
end
