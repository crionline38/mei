class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :set_adherent, only: [:query, :querytwo, :yes, :new]

  def index
    if params[:query].present?
      sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
      @students = Student.where(sql_query, query: "%#{params[:query]}%").order('first_name')
    else
      @students = Student.order('first_name')
    end
    @students2 = Student.all
  end

  def show
    @adherent = @student.user
  end

  def query
  end

  def querytwo
  end

  def yes
    @hidden = "hidden"
    @student = Student.new({ user: @adherent })
  end

  def new
    @hidden = ""
    @student = Student.new({ user: @adherent })
  end

  def edit
    @adherent = current_user
  end

  def create
    @student = Student.new(student_params)
      if @student.save
        redirect_to adherent_querytwo_path(@student.user), notice: 'Elève créé.'
      else
        render :new
      end
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Elève updaté.'
    else
      format.html { render :edit }
    end
  end

  def destroy
    user=@student.user
    @student.destroy
    redirect_to adherent_path(user), notice: 'Elève effacé.'
  end

  private
    def set_adherent
      @adherent = User.find(params["adherent_id"])
    end

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:first_name, :last_name, :year, :user_id)
    end
end
