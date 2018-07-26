class HomeController < ApplicationController
  def index
    @home = Image.all

    @q = Image.ransack(params[:q])          #Ransack gem's  Paul Ancajima
    @home = @q.result(distinct: true)     #Simple search
  end

  def result

    @home = Image.all
    @q = Image.ransack(params[:q])          #Ransack gem's  Paul Ancajima
    @home = @q.result(distinct: true)    #Simple search
    if @home.count == 0
      @home = Image.all
    end
  end

end