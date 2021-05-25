# rubocop:disable Layout/LineLength
class DealsController < ApplicationController
  def index
    @deals = if params['solo']
    Deal.where(author: current_user).includes(:deals_groups).where(deals_groups: { id: nil }).includes([:groups])
    #else
    #Deal.where(author: current_user).includes(:deals_groups).where.not(deals_groups: { id: nil })
    end
  end

  def new
      @deal = Deal.new
    end
  end

  def create

    if @deal.save
      flash[:notice] = 'Deal was created successfully!'
      if request.original_url.include?('groups')
        redirect_to @group
      else
        redirect_to @deal
      end
    else
      render :new
    end
  end

  def show
    @deal = Deal.find(params[:id])
  end

  def deal_params
    params.require(:deal).permit(:title, :amount, :author, :group)
  end
end
# rubocop:enable Layout/LineLength