# Zac Henney, Paul Ancajima
# Contoller for Home page views. Search is currently controlled here
# Methods
# index contains search function and persistent category selection logic
#


class HomeController < ApplicationController
  def index

    @home = Image.all
    @approved_images = Image.where(status_id: 1).all
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

      # if specific category selected check that query (q) and category id exists
    elsif params[:q][:category_id].present?
      @user_cat_name = Category.find(@user_cat_id).name unless params[:q].nil?
      @user_search = params[:q][:image_title]
    end

    #Search function (ransack gem) - first searches categories then image title
    @q = Image.ransack(category_id_eq: @user_cat_id, image_title_cont: @user_search)

    #Set search result to @home instance variable for display
    @home = @q.result


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