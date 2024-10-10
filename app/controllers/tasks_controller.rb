class TasksController < ApplicationController
  def index
    @tasks = Task.where(status: 'incomplete') 
    @task = Task.new  
  end

  def create
    @task = Task.new(task_params)
    @task.status = 'incomplete'
    if @task.save
      redirect_to tasks_path
    else
      render :index
    end
  end

  def complete
    @task = Task.find(params[:id])
    if @task.update(status: 'complete')
      redirect_to tasks_path, notice: 'Task marked as complete!'
    else
      redirect_to tasks_path, alert: 'Failed to mark task as complete.'
    end
  end

  def completed
    @completed_tasks = Task.where(status: 'complete')
  end
  

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
