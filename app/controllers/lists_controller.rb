class ListsController < ApplicationController
  def index
     @lists = List.all
     authorize @lists
  end

  def new
     @list = List.new
     authorize @list
  end

  def show
     @list = List.find(params[:id])
     @items = @list.items
     authorize @list
  end

  def edit
     @list = List.find(params[:id])
     authorize @list
  end
 
   def create
     @list = List.new(params.require(:list).permit(:name, :public))
     authorize @list
     if @list.save
       redirect_to @list, notice: "List was saved successfully."
     else
       flash.now[:error] = "Error creating list. Please try again."
       render :new
     end
   end
 
   def update
     @list = List.find(params[:id])
     authorize @list
     if @list.update_attributes(params.require(:list).permit(:name, :public))
       redirect_to @list
     else
       flash.now[:error] = "Error saving list. Please try again."
       render :edit
     end
   end

end
