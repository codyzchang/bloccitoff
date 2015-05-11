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
    @item = Topic.find(params[:id])
    authorize @item
  end
  
  
  
  def create
     @item = Item.new(params.require(:item).permit(:name, :public))
     authorize @item
     if @item.save
       redirect_to @item, notice: "Item was saved successfully."
   else
      flash.now[:error] = "Error creating Item. Please try again."
      render :new
   end
  end

  
end