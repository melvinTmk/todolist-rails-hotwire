class TasksController < ApplicationController

    def index 
        @tasks = Task.all
        @task = Task.new
    end

    def create 
        @task = Task.new(params_task)

        respond_to do |format|
            if @task.save 
                format.html {redirect_to '', notice: 'Votre tâche a été ajoutée avec succès'}
            else
                format.html {render :new, status: :unprocessable_entity}
            end
        end
    end

    def toggle
        @task = Task.find(params[:id])
        @task.update(completed: params[:completed])

        render json: { message: "Success"}
    end

    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])

        respond_to do |format|
            if @task.update(params_task)
                format.html { redirect_to '', notice: "Votre tâche a été modifiée avec succès" }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        
        redirect_to '', notice: "Votre tâche a été supprimée avec succès."
    end


    private

    def params_task
        params.require(:task).permit(:description)
    end
end
