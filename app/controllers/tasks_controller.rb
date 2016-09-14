class TasksController < ApplicationController

  def show_form
    @task = Task.new
  end

  def hide_form
    @task = Task.hide_form(task_params)
    @tasks = Task.all
  end

  def new
    @task = Task.new
    render :show_form
  end

  def edit
    @task = Task.find(params[:id])
    render :show_form
  end

  def create
    @task = Task.create(task_params)
    @tasks = Task.all

    if @task.save
      @tasks = Task.all
      render :hide_form
    else
      render :show_form
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.assign_attributes(task_params)
    if @task.save
      @tasks = Task.all
      render :hide_form
    else
      render :show_form
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    @tasks = Task.all
  end

  private
  def task_params
    params.require(:task).permit(:title, :note, :deadline)
  end

end
