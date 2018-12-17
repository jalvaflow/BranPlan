class StaticPagesController < ApplicationController

  def home
    if current_user
      redirect_to dashboard_path
    end
  end

  def about
  end

  def help
  end

  def search
    @subjects = Subject.order(:name).uniq{|subject| subject.name}
    @terms = Term.order(:name)
    @courses = Course.where(term: "1183")
    # EDIT FOR ALL FIELDS
    if !params[:query].nil? || !params[:code].nil? || !params[:description].nil?
      @query = params[:query].downcase unless params[:query] == ""
      @code = params[:code].upcase unless params[:code] == ""
      @description = params[:description].downcase unless params[:description] == ""
      @term = ""
      if params[:term] != 'Any'
        @term = Term.where(name: params[:term])[0][:term_id]
      end
      @courses = Course.where("lower(name) LIKE ? AND code LIKE ? AND description LIKE ? AND term LIKE ?", "%#{@query}%", "%#{@code}%", "%#{@description}%", "%#{@term}%")
    end
    # After the fact, take into consideration course attributes not in the Course object (Ex. instructor, subject, etc)
    # NOTE: Do params == nil check to save time efficently (will need many loops)

    # Saves uniq course by code and paginates.
    @courses = @courses.sort_by { |c| [c.code.split(" ")[0], c.code.split(" ")[1].length, c.code.split(" ")[1]] }
    @courses = @courses.paginate(:per_page => 15, page: params[:page])
  end
end
