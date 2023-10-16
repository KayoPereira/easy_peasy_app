class StudentsController < ApplicationController
  before_action :set_student, only: %i[destroy]
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path(@student)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @student.destroy
    redirect_to students_path notice: "Student was successfully destroyed", status: :see_other
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :monthly_lessons, :language, :level, :current_month)
  end
end
