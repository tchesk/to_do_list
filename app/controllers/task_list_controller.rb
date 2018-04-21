class TaskListController < ApplicationController
  def index
    @lists = TaskList.all
    @list = TaskList.find_by(params[:id])
  end
  def show
    @list = TaskList.find_by(params[:id])
  end
end
