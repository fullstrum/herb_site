class GroupsController < ApplicationController
  def show
    @group = User.find(params[:id])
  end

  def new
  	@group = Group.new
  end

  def create
    @group = Group.new(params[:group])
    if @group.save
      flash[:success] = "Group created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

end