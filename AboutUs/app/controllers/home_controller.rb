# Zac Henney, Paul Ancajima
# Contoller for Home page views. Search is currently controlled here
# Methods
# index contains search function and persistent category selection logic
#


class HomeController < ApplicationController
  def index

    # Author: Paul Ancajima
    # Purpose: New search gem 'searchkick' with better features see https://github.com/ankane/searchkick for more details
    # Variables to Note: @image_search is used to search it takes arguments param[:q] and options then perform search queries
    #                    @cat is the category_id
    # Variables to Note: Added @PNG @GIF and JPEG for filtering by file type. Value will be 1 if true. Look in _search_images on how to display
    # Date: 7/27/18
    # Update: 7/30/18
    # Update: 8/6/18 Added to homecontroller and connected to home's index view
    query = params[:q].presence || '*'
    @imagesearch = Image.search(query, suggest: true)
    @images = Image.all
    if params[:j].present? #if category is present in the params
      if params[:j][:category_id].empty? #if category is empty
        @imagesearch = Image.search(query, fields: [:image_title, :description, :category_name], match: :word_start, operator: 'or', suggest: true) #use search bar or search everything
        @image_all = Image.search('*')

        if params[:PNG].present? || params[:GIF].present? || params[:JPEG].present?
          @PNG = params[:PNG]
          @GIF = params[:GIF]
          @JPEG = params[:JPEG]

          if params[:PNG].present? && params[:GIF].present?
            @imagesearch = Image.search(query, suggest: true, fields: [:image_title, :description, :category_name], match: :word_start, operator: 'or', where: {file_type: ['PNG', 'GIF', 'JPEG']})
          elsif params[:PNG].present? && params[:GIF].present?
            @imagesearch = Image.search(query, suggest: true, fields: [:image_title, :description, :category_name], match: :word_start, operator: 'or', where: {file_type: ['PNG', 'GIF']})
          elsif params[:PNG].present? && params[:JPEG].present?
            @imagesearch = Image.search(query, suggest: true, fields: [:image_title, :description, :category_name], match: :word_start, operator: 'or', where: {file_type: ['PNG', 'JPEG']})
          elsif params[:JPEG].present? && params[:GIF].present?
            @imagesearch = Image.search(query, suggest: true, fields: [:image_title, :description, :category_name], match: :word_start, operator: 'or', where: {file_type: ['JPEG', 'GIF']})
          elsif params[:PNG].present?
            @imagesearch = Image.search(query, suggest: true, fields: [:image_title, :description, :category_name], match: :word_start, operator: 'or', where: {file_type: 'PNG'})
          elsif params[:GIF].present?
            @imagesearch = Image.search(query, suggest: true, fields: [:image_title, :description, :category_name], match: :word_start, operator: 'or', where: {file_type: 'GIF'})
          else
            @imagesearch = Image.search(query, suggest: true, fields: [:image_title, :description, :category_name], match: :word_start, operator: 'or', where: {file_type: 'JPEG'})
          end
        end

      else #else
        @cat = params['j']['category_id'] #we will query with category aggregate
        @imagesearch = Image.search(query, suggest: true, fields: [:image_title, :description, :category_name], match: :word_start, operator: 'or', where: {category_id: @cat})
        @image_all = Image.search('*', where: {category_id: params['j']['category_id']})


        if params[:PNG].present? || params[:GIF].present? || params[:JPEG].present?
          @PNG = params[:PNG]
          @GIF = params[:GIF]
          @JPEG = params[:JPEG]

          if params[:PNG].present? && params[:GIF].present?
            @imagesearch = Image.search(query, suggest: true, fields: [:image_title, :description, :category_name], match: :word_start, operator: 'or', where: {file_type: ['PNG', 'GIF', 'JPEG'], category_id: @cat})
          elsif params[:PNG].present? && params[:GIF].present?
            @imagesearch = Image.search(query, suggest: true, fields: [:image_title, :description, :category_name], match: :word_start, operator: 'or', where: {file_type: ['PNG', 'GIF'], category_id: @cat})
          elsif params[:PNG].present? && params[:JPEG].present?
            @imagesearch = Image.search(query, suggest: true, fields: [:image_title, :description, :category_name], match: :word_start, operator: 'or', where: {file_type: ['PNG', 'JPEG'], category_id: @cat})
          elsif params[:JPEG].present? && params[:GIF].present?
            @imagesearch = Image.search(query, suggest: true, fields: [:image_title, :description, :category_name], match: :word_start, operator: 'or', where: {file_type: ['JPEG', 'GIF'], category_id: @cat})
          elsif params[:PNG].present?
            @imagesearch = Image.search(query, suggest: true, fields: [:image_title, :description, :category_name], match: :word_start, operator: 'or', where: {file_type: 'PNG', category_id: @cat})
          elsif params[:GIF].present?
            @imagesearch = Image.search(query, suggest: true, fields: [:image_title, :description, :category_name], match: :word_start, operator: 'or', where: {file_type: 'GIF', category_id: @cat})
          else
            @imagesearch = Image.search(query, suggest: true, fields: [:image_title, :description, :category_name], match: :word_start, operator: 'or', where: {file_type: 'JPEG', category_id: @cat})
          end
        end
      end
    end


    @home = Image.all
    @approved_images = Image.where(status_id: 1).all
    # if current_user != nil
    #   if current_user.is_admin
    #     redirect_to admin_path
    #   end
    # end
    # # get category selected by user for persistent selection
    # # strip category and search params into variables @user_cat_id and @user_search
    # # this allows for the search function to search first through categories then for the search(image title)
    # # at home page no search performed yet
    # if params[:q].nil? || params[:q][:category_id].nil?
    #   @user_cat_name = "All"
    #
    #   # if 'All' selected check only that query (q) was made
    # elsif params[:q].present?
    #   @user_cat_id = params[:q][:category_id] unless params[:q].nil?
    #   @user_search = params[:q][:image_title]
    #
    #   # if specific category selected check that query (q) and category id exists
    # elsif params[:q][:category_id].present?
    #   @user_cat_name = Category.find(@user_cat_id).name unless params[:q].nil?
    #   @user_search = params[:q][:image_title]
    # end
    #
    # #Search function (ransack gem) - first searches categories then image title
    # @q = Image.ransack(category_id_eq: @user_cat_id, image_title_cont: @user_search)
    #
    # #Set search result to @home instance variable for display
    # @home = @q.result

  end

  def result

    @home = Image.all
    @q = Image.ransack(params[:q])       #Ransack gem's
    @home = @q.result(distinct: true)    #Simple search
    if @home.count == 0
      @home = Image.all
    end
  end

  #parsing the user's category search selection for persistent selection

end