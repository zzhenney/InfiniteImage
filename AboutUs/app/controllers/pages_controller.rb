class PagesController < ApplicationController
  def index
  end
<<<<<<< HEAD
=======

  def show
    render template: "pages/#{params[:page]}"
  end
>>>>>>> b439d74558a4e86b847d5f52112aad3328342bf2
end
