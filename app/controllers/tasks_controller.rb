class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
     
    if @task.save
      flash[:success] = "タスクが追加されました"
      redirect_to @task
    else
      flash[:dander] = "タスクの追加ができませんでした"
      render :new
    end
  end
  

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:succes] = "タスクを変更しました"
      redirect_to @task
    else 
      flash[:danger] = "タスクの変更ができませんでした"
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success]="タスクが削除されました"
    redirect_to tasks_url
  end
  
  private

  def task_params
    params.require(:task).permit(:content)
  end

end

private

