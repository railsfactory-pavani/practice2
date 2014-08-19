class TodosController < ApplicationController
=begin
 before_filter :check_for_reset, :only => [:create, :update]

  def check_for_reset
    if params[:commit] == "Reset"
     redirect_to new_todo_path
    end
  end
=end 
  def index
    @todos = Todo.all
    @todos = Todo.where(user_id: current_user.id)
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new 
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(params[:todo].permit(:name, :status))
    @todo.user = current_user
    
   if @todo.save
     redirect_to todos_path, :notice => "Your task was saved."
    else
      render "new"
    end
  end
  
  def edit
    @todo = Todo.find(params[:id])
  end
 
  def mark
    @todo = Todo.find(params[:todo_id])
    @todo.update(:status => "completed")
     redirect_to todos_path, :notice => "Your task was marked as completed."
  end

  def update
    @todo = Todo.find(params[:id])
    
    if @todo.update_attributes(params[:todo].permit(:name, :status))
      redirect_to todos_path, :notice => "Your task was updated."
    else
      render "edit"
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path, :notice => "Your task has been Deleted"
  end
end
