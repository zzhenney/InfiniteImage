class AdminController < ApplicationController

  def image
    @images = Image.all
    @users = User.all

  end

  def approve
    @image = Image.find(params[:id])
    @image.status = 1
  end

end