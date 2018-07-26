# Zac Henney, Paul Ancajima
# Contoller for Home page views. Search is currently controlled here
# Methods
# index contains search function
# parse_cat_id() - parses the user's search category id for persistent category selection


class HomeController < ApplicationController
  def index
    @home = Image.all

    @q = Image.ransack(params[:q])          #Ransack gem's

    #get category selected by user for persistent selection
    @user_cat_id = params[:q][:category_id]
    @user_cat_name = Category.find(@user_cat_id).name

    @home = @q.result(distinct: true)     #Simple search
  end

  def result
    @home = Image.all
    @q = Image.ransack(params[:q])       #Ransack gem's
    @home = @q.result(distinct: true)    #Simple search
  end

  #parsing the user's category search selection for persistent selection




end