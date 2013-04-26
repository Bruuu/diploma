class SprintsController < ApplicationController
  def index
    @project = current_user.projects.find(params[:project_id])
    @sprints = @project.sprints
  end

  def show
    @project = current_user.projects.find(params[:project_id])
    @sprint = @project.sprints.find(params[:id])
  end

  def new
    @project = current_user.projects.find(params[:project_id])
    @sprint = @project.sprints.new
  end

  def edit
    @project = current_user.projects.find(params[:project_id])
    @sprint = @project.sprints.find(params[:id])
  end

  def create
    @project = current_user.projects.find(params[:project_id])
    @sprint = @project.sprints.new(params[:sprint])
    if @sprint.save
      redirect_to [@project, @sprint]
    else
      render action: "new"
    end
  end

  def update
    @project = current_user.projects.find(params[:project_id])
    @sprint = @project.sprints.find(params[:id])
    if @sprint.update_attributes(params[:sprint])
      redirect_to [@project, @sprint]
    else
      render action: "edit"
    end
  end

  def destroy
    @project = current_user.projects.find(params[:project_id])
    @sprint = @project.sprints.find(params[:id])
    @sprint.destroy
    redirect_to @project
  end
end
