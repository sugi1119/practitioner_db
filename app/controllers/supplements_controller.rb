class SupplementsController < ApplicationController

  def index
    @supplements = Supplement.all
  end

  def create
    supplement = Supplement.create supplement_params

    if supplement.save
      redirect_to supplement
    else
      render :new
    end

  end

  def new
    @supplement = Supplement.new
  end

  def edit
    @supplement = Supplement.find params[:id]
  end

  def show
    @supplement = Supplement.find params[:id]
    @supplements = Supplement.all
  end

  def upate
    supplement = Supplment.find params[:id]

    if supplement.update supplement_params
      redirect_to supplement
    else
      render :edit
    end

  end

  def destroy
    supplement = Supplement.find params[:id]
    supplement.destroy

    redirect_to supplement_path
  end

  private
    def supplement_params
      params.require(:supplement).permit(:item_name, :package_amount, :item_cost)
    end
end

# t.string :item_name
# t.float :package_amount
# t.float :item_cost

#    supplements GET    /supplements(.:format)                        supplements#index
#                 POST   /supplements(.:format)                        supplements#create
#  new_supplement GET    /supplements/new(.:format)                    supplements#new
# edit_supplement GET    /supplements/:id/edit(.:format)               supplements#edit
#      supplement GET    /supplements/:id(.:format)                    supplements#show
#                 PATCH  /supplements/:id(.:format)                    supplements#update
#                 PUT    /supplements/:id(.:format)                    supplements#update
#                 DELETE /supplements/:id(.:format)                    supplements#destroy