class TasksController < ApplicationController
    before_action :set_task, only: [:edit,:contenu, :update, :destroy, :confirm_destroy]
  
    def index
      @tasks = Task.all
    end
  
    def new
      @task = Task.new
    end
  
    def create
      @task = Task.new(task_params)
      if @task.save
        redirect_to tasks_path, notice: 'La tâche a été mise à jour avec succès.'
      else
        render :new
      end
    end
  
    def edit
    end
    
    def contenu
    end
  
    def update
      if @task.update(task_params)
        redirect_to tasks_path, notice: 'La tâche a été mise à jour avec succès.'
      else
        render :edit
      end
    end
  
    def destroy
      @task.destroy
      redirect_to tasks_path, notice: 'La tâche a été supprimée avec succès.'
    end
  
    def confirm_destroy
    end
  
    private
  
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:title, :description,:dayforexecution)
    end

end