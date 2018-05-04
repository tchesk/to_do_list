class TaskListsController < ApplicationController

  def index
    @lists = TaskList.all
  end

  def show
    @task_list = TaskList.find(params[:id])
  end

  def new
    @list = TaskList.new
  end

  def create
    @tasklist = TaskList.new task_list_params
    @tasklist.user = current_user
    if @tasklist.save
      redirect_to root_path
    else
      flash[:error] = 'Campo título e obrigatório!'
      render :new
    end
  end

  private

  def task_list_params
   params.require(:task_list).permit(:title)
  end
end
