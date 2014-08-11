class TasksController < ApplicationController
  def index
  	@tasks = Task.where(parent_id: nil)
    @child_tasks = Task.where("parent_id IS NOT NULL")
    @parent_ids = []
    @child_tasks.each do |t|
       @parent_ids<<t.parent_id
     end
    # @parent = []
    # @child_tasks.each do |t|
    #   @parent<<(Task.find(t.parent_id)).task
    # end
  end
end
