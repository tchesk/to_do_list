class TaskListController < ApplicationController
  def index
    @lists = TaskList.all
  end
  def show
    @list = TaskList.find_by(params[:id])
  end
end
