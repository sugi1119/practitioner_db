class ServicemenusController < ApplicationController

  def index
    @servicemenus = Servicemenu.all
  end

  def create
    servicemenu = Servicemenu.create servicemenu_params

    if servicemenu.save
      redirect_to servicemenu
    else
      render :new
    end
  end

  def new
    @servicemenu = Servicemenu.new
  end

  def edit
    @servicemenu = Servicemenu.find params[:id]
  end

  def show
    @servicemenu= Servicemenu.find params[:id]
  end

  def update
    servicemenu = Servicemenu.find params[:id]

    if servicemenu.save
      servicemenu.update servicemenu_params
      redirect_to servicemenu
    else
      render :new
    end
  end

  def destroy
# raise 'err'
    servicemenu = Servicemenu.find params[:id]
    servicemenu.destroy

    redirect_to servicemenus_path
  end

  private
    def servicemenu_params
      params.require(:servicemenu).permit(:service_item, :service_cost)
    end
end

# t.string   "service_item"
# t.float    "service_cost"

# servicemenus GET    /servicemenus(.:format)   servicemenus#index
#             POST   /servicemenus(.:format)    servicemenus#create
#new_servicemenu GET    /servicemenus/new(.:format) servicemenus#new
#edit_servicemenu GET    /servicemenus/:id/edit(.:format) servicemenus#edit
#     servicemenu GET    /servicemenus/:id(.:format)  servicemenus#show
#                 PATCH  /servicemenus/:id(.:format)  servicemenus#update
#                PUT    /servicemenus/:id(.:format)   servicemenus#update