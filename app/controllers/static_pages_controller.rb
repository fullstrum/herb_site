class StaticPagesController < ApplicationController
  def home
  	@group = Group.new
  end

  def contact
  end
end
