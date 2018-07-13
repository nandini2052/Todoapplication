class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :show , :destroy]
  def new
   @todo =Todo.new
  end
  def create
  	@todo = Todo.new(todo_params)
  	if @todo.save
  	  flash[:notice] = "Todo is created successfully"	
  	  redirect_to todo_path(@todo)
  	else
  	  render 'new'
  	end  	

  end
  def edit
     
  end
  def show 
    

  end
  def index
    @todos=Todo.all
  end
  def destroy 
   
    @todo.destroy
    flash[:notice] = "Todo is destroyed successfully"
    redirect_to todos_path
  end

  def update
    
    if @todo.update(todo_params)
      flash[:notice] = "Todo is updated successfully" 
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end 

  end

  private

    def set_todo
       @todo = Todo.find(params[:id])
    end

  	def todo_params
  		params.require(:todo).permit(:name, :description)

  	end

end