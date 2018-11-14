class StaticPagesController < ApplicationController

  def home
    if current_user
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
