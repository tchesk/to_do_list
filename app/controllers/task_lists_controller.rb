class TaskListsController < ApplicationController
  def index
    @lists = TaskList.all
    @list = TaskList.find_by(params[:id])
  end
  def show
    @list = TaskList.find_by(params[:id])
  end
  def new
    @lists = TaskList.new
  end
  def create
    task_list = params.require(:task_list).permit(:title)

    @tasklist = TaskList.new(task_list)

    if @tasklist.save
      redirect_to task_list_path(@tasklist.id)
    else
      flash[:error] = 'Campo título e obrigatório!'
      render :new
    end
  end
end
