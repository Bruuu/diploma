class ProjectsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @projects = current_user.projects
  end

  def show
    @project = current_user.projects.find(params[:id])
  end

  def new
    @project = current_user.projects.new
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def create
    @project = current_user.projects.new(params[:project])
    if @project.save
      redirect_to @project
    else
      render action: "new"
    end
  end

  def update
    @project = current_user.projects.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project
    else
      render action: "edit"
    end
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
    redirect_to projects_url
  end
end
