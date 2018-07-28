class AdminController < ApplicationController

  before_action :admin
  def index
  end

  def image
    @images = Image.all
    @users = User.all

  end

  def approve
    @image = Image.find(params[:id])
    @image.status = 1
  end

  private

  def admin
    redirect_to home_index_path unless current_user.is_admin?
  end

end