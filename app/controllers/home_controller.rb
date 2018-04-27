class HomeController < ApplicationController
  def index
    @task = TaskList.all
  end
end
