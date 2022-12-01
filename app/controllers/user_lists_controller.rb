class UserListsController < ApplicationController
  before_action :set_list, only: %i[new create]
  before_action :set_user, only: %i[new create]

  def new
    @user_list = UserList.new
  end

  def create
    @user_list = UserList.new(user_list_params)
    @user_list.user = @user
    @user_list.list = @list
    if @user_list.save
      redirect_to list_path(@list), notice: 'The user was added to the list'
    else
      render :new, status: :unprocessable_entity, notice: 'The user was not added to the list.'
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_user
    @user = current_user
  end

  def user_list_params
    params.require(:user_list).permit(:user_id, :list_id)
  end

end
