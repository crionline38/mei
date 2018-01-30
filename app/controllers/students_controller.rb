class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :set_adherent, only: [:query, :querytwo, :yes, :new]

   def index
    @students = Student.all
  end

  def show
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
  end

  def create
    @student = Student.new(student_params)
      if @student.save
        redirect_to adherent_querytwo_path(@student.user), notice: 'Student was successfully created.'
      else
        render :new
      end
  end

  def update
    if @student.update(student_params)
      format.html { redirect_to @student, notice: 'Student was successfully updated.' }
    else
      format.html { render :edit }
    end
  end

  def destroy
    user=@student.user
    @student.destroy
    redirect_to adherent_path(user), notice: 'Student was successfully destroyed.'
  end

  private
    def set_adherent
      @adherent = User.find(params["adherent_id"])
    end

    def set_student
      p params
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:first_name, :last_name, :year, :user_id)
    end
end
