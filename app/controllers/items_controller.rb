class ItemsController < ApplicationController


  def create
    @user = current_user
    @item = Item.create(item_params)
    @item.user = current_user

    @item.save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
#    if @item.save
#      flash[:notice] = "New item has been saved."
#      redirect_to user_path(current_user)
#    else
#      flash[:alert] = "There was an error saving the item, please try again."
#      render :create
#    end
  end

  def destroy
    @user = current_user
    @item = Item.find(params[:id])
    @item.destroy

    @items = @user.items.all


#      flash[:notice] = "\"#{@item.name}\" completed."
#      redirect_to root_path
#    else
#      flash.now[:alert] = "There was an error completing the item. Please try again."
#      redirect_to root_path
#    end

  end

  def item_params
    params.require(:item).permit(:name)
  end

end
