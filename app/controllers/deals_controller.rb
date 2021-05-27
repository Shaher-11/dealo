# rubocop:disable Layout/LineLength
class DealsController < ApplicationController


  before_action :authenticate_with_http_digest
  def index
    @deall = Deal.all
    @deals = if params['solo']
               Deal.where(author: current_user).includes(:deals_groups).where(deal_groups: { id: nil }).includes([:groups])
             else
               Deal.where(author: current_user).includes(:deals_groups).where.not(deal_groups: { id: nil })
             end
  end

  def new
    return if request.original_url.include?('groups')

    @group = Group.find(params[:group_id])
    @deal = Deal.new
  end

  def create
    if request.original_url.include?('groups')
      @group = Group.find(params[:group_id])
      @deal = Deal.create(deal_params)
      @deal.groups << @group

    else
      @deal = Deal.create(deal_params)
    end
    @deal.author = current_user

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