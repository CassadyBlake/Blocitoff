class ItemsController < ApplicationController


  def create
    @user = current_user
    @item = Item.create(item_params)
    @item.user = current_user

    respond_to do |format|
      format.html do
        if @item.save
          flash[:notice] = "New item has been saved."
        else
          flash[:alert] = "There was an error saving the item, please try again."
        end
        redirect_to root_path
      end

      format.js do
        if @item.save
          flash.now[:notice] = "New item has been saved."
        else
          flash.now[:alert] = "There was an error saving the item, please try again."
        end
      end
    end
  end

  def destroy
    @user = current_user
    @item = Item.find(params[:id])
    @item.destroy

    @items = @user.items.all
  end

  def item_params
    params.require(:item).permit(:name)
  end

end
