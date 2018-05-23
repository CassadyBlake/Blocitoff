class UsersController < ApplicationController
  def show
    @user = current_user
    @items = @user.items.all

    respond_to do |format|
      format.html
      format.json
    end 
  end
end
