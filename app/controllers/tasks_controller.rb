class TasksController < ApplicationController
  def new   
  	@task = Task.new 
    render :show_form
  end

  def create     
  	@task = Task.create(task_params)     
  	save_task
  end   

  def destroy 
    @task = Task.find(params[:id]) 
    @task.destroy 
    @tasks = Task.all 
  end 

  def edit 
    @task = Task.find(params[:id]) 
    render :show_form
  end

  def update
    @task = Task.find(params[:id])
    @task.assign_attributes(task_params)
    save_task
  end

  private   
  def task_params     
  	params.require(:task).permit(:title, :note, :completed)   
  end 

  def save_task 
    if @task.save 
      @tasks = Task.all 
      render :hide_form 
    else 
      render :show_form 
    end 
  end
end
