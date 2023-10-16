class PaymentsController < ApplicationController
  before_action :set_student, only: %i[new create student_index destroy]
  before_action :set_payment, only: %i[destroy]
  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.student_id = @student.id
    if @payment.save
      redirect_to student_student_payment_index_path(@student.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def student_index
    @payments = Payment.where(student_id: params[:student_id])
  end

  def destroy
    @payment.destroy
    redirect_to student_student_payment_index_path(student_id: @student.id), notice: "Student was successfully destroyed", status: :see_other
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:price, :month, :student_id)
  end

  def set_student
    @student = Student.find(params[:student_id])
  end
end
