class TaskListsController < ApplicationController

  def index
    @lists = TaskList.all
  end

  def show
    @list = TaskList.find_by(params[:id])
  end

  def new
    @lists = TaskList.new
  end

  def create
    @tasklist = TaskList.new task_list_params
    @tasklist.user = current_user
    if @tasklist.save
      redirect_to task_list_path(@tasklist)
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
