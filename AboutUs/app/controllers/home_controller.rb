# Zac Henney, Paul Ancajima
# Contoller for Home page views.
# Notes: Search is currently controlled here
# Methods:
# index method contains search function and persistent category selection logic



class HomeController < ApplicationController
  def index


    @show_all_images = Image.all

    #Paul Ancajima 8/8/18
    # if no images are found show some random images
    #   show half the number of images
    #   keep number of images shown max 10
    number_of_images = Image.count/2
    if number_of_images > 10
      number_of_images = 10
    end
    @some_random_images = Image.order("RAND()").first(number_of_images)


    #To setup params key 'page'. The method paginate comes from gem 'will_paginate'    Paul Ancajima
    @home = Image.paginate(page: params[:page])
    @approved_images = Image.paginate(page: params[:page]).where(status_id: 1).all
    if current_user != nil
      if current_user.is_admin
        redirect_to admin_path
      end
    end

    # get category selected by user for persistent selection
    # strip category and search params into variables @user_cat_id and @user_search
    # this allows for the search function to search first through categories then for the search(image title)
    # at home page no search performed yet
    if params[:q].nil? || params[:q][:category_id].nil?
      @user_cat_name = "All"

      # if 'All' selected check only that query (q) was made
    elsif params[:q].present?
      @user_cat_id = params[:q][:category_id] unless params[:q].nil?
      @user_search = params[:q][:image_title]
      @file_type = params[:q][:file_type]

      # if specific category selected check that query (q) and category id exists
    elsif params[:q][:category_id].present?
      @user_cat_name = Category.find(@user_cat_id).name unless params[:q].nil?
      @user_search = params[:q][:image_title]
      @file_type = params[:q][:file_type]

    end

    #Search function (ransack gem) - first searches categories then image title
    @q = Image.ransack(category_id_eq: @user_cat_id, image_title_cont: @user_search, file_type_cont: @file_type)

    #Set search result to @home instance variable for display
    #Set pagination per page here
    #Paul Ancajima 8/8/18 display showing x out of y images where images are approved
    @home = @q.result.paginate(page: params[:page], per_page: 4).where(status_id: 1)
  end

  def result
    @home = Image.all
    @q = Image.ransack(params[:q]) #Ransack gem's
    @home = @q.result(distinct: true) #Simple search
    if @home.count == 0
      @home = Image.all
    end
  end

  #parsing the user's category search selection for persistent selection


end