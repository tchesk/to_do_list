class PublicTaskController < ApplicationController
  def index
    @pub_tasks = PublicTask.all
  end
end
