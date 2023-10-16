class StudentsController < ApplicationController
  before_action :set_student, only: %i[edit update destroy show]
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to student_path(@student)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @student_lessons = (1..(@student.monthly_lessons)).to_a
    @student_classes_given = (1..(@student.class_given)).to_a
  end

  def edit; end

  def update
    @student.update(student_params)
    redirect_to students_path
  end

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
