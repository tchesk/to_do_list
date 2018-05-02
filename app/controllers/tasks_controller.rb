class TasksController < ApplicationController
  def index
    @task = Task.all
  end
  def new
    @list = Task.new
    @task_list = TaskList.find_by(id: params[:id])
  end
  def create
    tasks_params = params.require(:task).permit(:title, :description)
    @tasks = Task.new(tasks_params)
    @tasks.task_list = current_user
    if @tasks.save
      redirect_to new_task_list_task_path(@tasks)
    else
      flash[:error] = 'Campo Título é obrigatório'
      render :new
    end
  end
end
