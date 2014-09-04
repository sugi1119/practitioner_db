class MenusController < ApplicationController

  def index
    @menus = Menu.all
  end

  def create
    menu = Menu.create menu_params

    if menu.save
      redirect_to menu
    else
      render :new
    end
  end

  def new
    @menu = Menu.new
  end

  def edit
    @menu = Menu.find params[:id]
  end

  def show
    @menu = Menu.find params[:id]
  end

  def update
    menu = Menu.find params[:id]

    if menu.save
      menu.update menu_params
      redirect_to menu
    else
      render :new
    end
  end

  def destroy
    menu = Menu.find params[:id]
    menu.destroy

    redirect_to menus_path
  end

  private
    def menu_params
      params.require(:menu).permit(:menu_item, :menu_cost)
    end
end

# t.string   "service_item"
# t.float    "service_cost"

