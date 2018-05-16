class ItemsController < ApplicationController

  def create
    @user = current_user
    @item = Item.new
    @item.name = params[:item][:name]
    @item.user = current_user

    if @item.save
      flash[:notice] = "New item has been saved."
      redirect_to user_path(current_user)
    else
      flash[:alert] = "There was an error saving the item, please try again."
      render :create
    end
  end

  def destroy
    @user = current_user
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" completed."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error completing the item. Please try again."
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:name)
  end

end
