class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index


    # @images = Image.all
    # #Ransack gem's  Paul Ancajima updated 7/17/18
    # @q = Image.ransack(params[:q]) #.each {|k, v| [k, v.strip!]}) #Strips trailing spaces
    # @images = @q.result(distinct: true).includes(:category) #Advance search
    # @q.build_condition if @q.conditions.empty? #Remove the if statement to add extra search groups

    @show_all_images = Image.all
    #To setup params key 'page'. The method paginate comes from gem 'will_paginate'    Paul Ancajima
    @home = Image.paginate(page: params[:page])
    @approved_images = Image.where(status_id: 1).all

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
    #Set pagination per page here

    #Only admins are allowed to this action otherwise will be redirected home
    if current_user
      if current_user.is_admin?
        @current_user_is_admin = current_user
      end
      redirect_to home_index_path unless current_user.is_admin?
    else
      redirect_to home_index_path
    end

    @home = @q.result.paginate(page: params[:page], per_page: 20)
  end


  def result
    @home = Image.all
    @q = Image.ransack(params[:q]) #Ransack gem's
    @home = @q.result(distinct: true) #Simple search
    if @home.count == 0
      @home = Image.all
    end
  end

  def search
    index
    render :index
  end

  def approve
    @image = Image.find(params[:id])
    @image.update(:status_id => 1)

    redirect_to admin_path
  end

  helper_method :approve

  def result

    @images = Image.all
    @q = Image.ransack(params[:q]) #Ransack gem's  Paul Ancajima
    @images = @q.result(distinct: true) #Simple search
    if @home.count == 0
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  def download
    @image.download
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  #gets filetype from image and saves it in database
  # Andre Leslie 07/23/18
  def get_file_type

    @image.uploads.each do |upload|
      filename_arr = upload.content_type.to_s.split('/')
      @image.file_type = filename_arr[1].upcase
    end

  end

  #associates User with Image
  # Andre Leslie 07/25/18
  def get_author
    @image.user = current_user
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    get_file_type

    if signed_in?
      get_author
    end


    respond_to do |format|

      if @image.save
        format.html {redirect_to @image, notice: 'Image was successfully created.'}
        format.json {render :show, status: :created, location: @image}
      else
        format.html {render :new}
        format.json {render json: @image.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html {redirect_to @image, notice: 'Image was successfully updated.'}
        format.json {render :show, status: :ok, location: @image}
      else
        format.html {render :edit}
        format.json {render json: @image.errors, status: :unprocessable_entity}
      end
    end
  end


  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html {redirect_to admin_path, notice: 'Image was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def image_params
    #Added uploads param 7/72018 Paul Ancajima
    params.require(:image).permit(:image_title, :image_owner_id, :category_id, :licensing, :date, :description, :file_type, :location, :status_id, uploads: [])
  end

end