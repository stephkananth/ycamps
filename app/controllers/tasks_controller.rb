class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @badge = @task.badge
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit;
  end

  # POST /tasks
  # POST /tasks.json
  def create
    task_name = params[:task][:name]
    badge_id = params[:task][:badge]
    description = params[:task][:description]

    @task = Task.new(name: task_name, badge_id: badge_id, description: description)

    if @task.save
      redirect_to badge_path(badge_id), notice: "Task — #{@task.name} was added to the system."
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    badge_id = @task.badge.id
    if @task.update(task_params)
      redirect_to badge_path(badge_id), notice: "#{@task.name} task was updated in the system."
    else
      render action: 'new'
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    badge_id = @task.badge.id
    @task.destroy
    redirect_to badge_path(badge_id), notice: "#{@task.name} location was removed from the system."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:name, :description, :badge_id)
  end
end
