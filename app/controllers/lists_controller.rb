class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @list_product = ListProduct.new
    @list_products = ListProduct.all
    @purchases = Purchase.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to list_path(@list), notice: 'Your list was successfully created.'
    else
      render :new, status: :unprocessable_entity, notice: 'Your list was not created.'
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to my_lists_path(current_user), status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
