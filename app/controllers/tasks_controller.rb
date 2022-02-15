class TasksController < ApplicationController
  before_action :find_task, only: [:show]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_parameters)
    redirect_to tasks_path
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_parameters
    params.require(:task).permit(:title, :details, :completed)
  end
end
