class TasksController < ApplicationController
  def index
    @task = Task.all
  end
  def new
    @task = Task.new
    @task_list = TaskList.find(params[:task_list_id])
  end
  def create
    tasks_params = params.require(:task).permit(:title, :description)
    @task_list = TaskList.find(params[:task_list_id])
    @task_list.tasks.build(tasks_params)

    if @task_list.save
      redirect_to  task_list_path(@task_list)
    else
      flash[:error] = 'Campo Título é obrigatório'
      render :new
    end
  end
end
