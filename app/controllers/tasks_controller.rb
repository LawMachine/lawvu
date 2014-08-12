class TasksController < ApplicationController
  before_filter :get_matter

  def index
    # @parent = []
    # @child_tasks.each do |t|
    #   @parent<<(Task.find(t.parent_id)).task
    # end
  end

  def add_task
    @tasks = Task.where(parent_id: nil)
    @child_tasks = Task.where("parent_id IS NOT NULL")
    @parent_ids = []
    @child_tasks.each do |t|
       @parent_ids<<t.parent_id
     end
  end

  def new
    @task = Task.find(params[:id])
    @users = User.all.collect(&:email)
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def get_matter
    @matter = Matter.find(params[:matter_id])
  end
end
