require 'decisiontree'

class StaticPagesController < ApplicationController
  @suggest_code = nil

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
    # NOTE: Do params == nil check to save time efficently (will need many loops

    @suggest_code = prediction()

    # Saves uniq course by code and paginates.
    @courses = @courses.sort_by { |c| [c.code.split(" ")[0], c.code.split(" ")[1].length, c.code.split(" ")[1]] }
    @courses = @courses.paginate(:per_page => 15, page: params[:page])
  end

  def prediction()
      dec_tree = train()
      user_course_history = UserCourseHistory.where(user_id: current_user.id)
      if !user_course_history.nil?
        user_course_history = user_course_history.map {|c| c.course_code }
        user_course_history = user_course_history.select{ |c| c.include? 'COSI' }.last(5)
        if user_course_history.length < 5
          times = 5-user_course_history.length
          (1..times).each do |i|
            user_course_history = user_course_history.unshift("None")
          end
        end
        @suggest_code = predict(user_course_history, dec_tree)
      else
        sample = ["None","None","None","None","None"]
        @suggest_code = predict(sample, dec_tree)
      end
      @suggest_code
  end

  def train
    labels = ["recent1","recent2","recent3","recent4","recent5","current"]
    cosi = [    [1, "None","None","None","None","None","COSI 11A"],
                [1, "None","None","None","None","COSI 11A","COSI 12B"],
                [1, "None","None","None","COSI 11A","COSI 12B","COSI 21A"],
                [2, "None","None","COSI 11A","COSI 12B","COSI 21A","COSI 29A"],
                [2, "None","None","COSI 11A","COSI 29A","COSI 12B","COSI 21A"],
                [1, "None","None","None","None","COSI 11A","COSI 12B"],
                [3, "COSI 29A","COSI 21A","COSI 101A","COSI 130A","COSI 166B","COSI 131A"],
                [1, "None","None","None","None","COSI 11A","COSI 21A"],
                [3, "COSI 12B","COSI 164A","COSI 29A","COSI 21A","COSI 130A","COSI 131A"],
                [1, "None","None","None","None","None","COSI 11A"],
                [2, "None","None","MATH 8A","COSI 11A","COSI 12B","COSI 21A"],
                [4,"MATH 23A","COSI 21A","COSI 155B","COSI 123A","COSI 130A","COSI 131A"],
                [3,"COSI 11A","COSI 12B","COSI 29A","COSI 21A","COSI 130A","COSI 131A"],
                [2,"None","COSI 11A","COSI 12B","COSI 118A","COSI 29A","COSI 21A"],
                [4,"COSI 101A","COSI 121B","COSI 155B","COSI 130A","COSI 165A","COSI 131A"],
                [3,"COSI 12B","COSI 130A","COSI 164A","COSI 155A","COSI 21A","COSI 29A"],
    ]

    dec_tree = DecisionTree::ID3Tree.new(labels, cosi, "COSI 11A", current: :discrete, recent1: :discrete, recent2: :discrete, recent3: :discrete, recent4: :discrete,recent5: :discrete)
    dec_tree.train
    return dec_tree
  end

  def predict(test,dec_tree)
  # test = ["None","None","COSI 11a","COSI 12b","COSI 29a","COSI 21a"]
    if test.count("None") > 2
      test.unshift(1)
    elsif test.include?("None")
      test.unshift(2)
    else
      if test.include?("COSI 29A")
        test.unshift(3)
      else
        test.unshift(4)
      end
    end
    test.push('COSI 11A')
  # puts test
    decision = dec_tree.predict(test)
  # puts "Predicted: #{decision} ... True decision: #{test.last}"
    return decision
  end

end
