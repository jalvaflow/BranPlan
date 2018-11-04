class StaticPagesController < ApplicationController

  def home
    if logged_in?
      redirect_to dashboard_path
    end
  end

  def about
  end

  def contact
  end

  def help
  end

end
