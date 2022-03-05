class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :start, :finish, :allday, :memo))
    if @task.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :tasks
    else
      render "new"
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
      if @task.update(params.require(:task).permit(:title, :start, :finish, :allday, :memo))
        flash[:notice] = "スケジュールを更新しました"
        redirect_to :tasks
      else
        render "edit"
      end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :tasks
  end

end
