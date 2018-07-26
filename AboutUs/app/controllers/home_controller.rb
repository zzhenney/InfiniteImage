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
    #at home page no search performed yet
    if params[:q].nil? || params[:q][:category_id].nil?
      @user_cat_name = "All"

    #if all selected check only that query (q) was made
    elsif params[:q].present?
      @user_cat_id = params[:q][:category_id] unless params[:q].nil?

    #if specific category selected check that query (q) and category id exists
    elsif params[:q][:category_id].present?
      @user_cat_name = Category.find(@user_cat_id).name unless params[:q].nil?
    end

    @home = @q.result(distinct: true).includes(:category)     #Simple search


  end

  def result
    @home = Image.all
    @q = Image.ransack(params[:q])       #Ransack gem's
    @home = @q.result(distinct: true)    #Simple search
  end

  #parsing the user's category search selection for persistent selection




end