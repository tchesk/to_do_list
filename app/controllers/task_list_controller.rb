class TaskListController < ApplicationController
  def index
    @list = TaskList.all
  end
end
