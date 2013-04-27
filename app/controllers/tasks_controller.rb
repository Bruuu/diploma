class TasksController < ApplicationController
  def show
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(params[:task])
    if @task.save
      redirect_to [@project, @task]
    else
      render action: "new"
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to [@project, @task]
    else
      render action: "edit"
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to @project
  end
end
