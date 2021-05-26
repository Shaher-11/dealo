class GroupsController < ApplicationController
  def index
    @groups = Group.all.order(:name)
  end

  def new
    @group = Group.new
  end

  def create
    user = User.find(current_user.id)
    @group = user.groups.build(group_params)

    if @group.save
      flash[:notice] = 'Group was created successfully!'
      redirect_to @group
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :user)
  end
end
