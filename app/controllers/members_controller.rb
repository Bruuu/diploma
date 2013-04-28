class MembersController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
  end

  def update
    project = Project.find(params[:project_id])
    member = Member.find(params[:id])
    member.update_attributes(params[:member])
    redirect_to project_members_path(project)
  end

  def create
    project = Project.find(params[:project_id])
    user = User.find(params[:member][:user_id])
    member = Member.new
    member.user = user
    member.project = project
    member.role = params[:member][:role]
    member.save
    redirect_to project_members_path(project)
  end

  def destroy
    Member.find(params[:id]).destroy
    redirect_to project_members_path(project)
  end
end
