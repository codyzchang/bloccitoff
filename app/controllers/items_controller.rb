class ItemsController < ApplicationController
  def index
    @items = Item.all
    authorize @items
  end

  def new
    @item = Item.new
    authorize @item
  end

  def show
    @item = Item.find(params[:id])
     authorize @item
  end

  def edit
    @item = Item.find(params[:id])
     authorize @item
  end
 
   def create
     @item = Item.new(params.require(:item).permit(:name, :description, :public))
     authorize @item
     if @item.save
       redirect_to @item, notice: "Item was saved successfully."
     else
       flash.now[:error] = "Error creating item. Please try again."
       render :new
     end
   end
 
   def update
     @item = Item.find(params[:id])
     authorize @item
     if @item.update_attributes(params.require(:item).permit(:name, :description, :public))
       redirect_to @item
     else
       flash.now[:error] = "Error saving item. Please try again."
       render :edit
     end
   end
end