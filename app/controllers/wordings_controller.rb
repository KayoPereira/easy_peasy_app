class WordingsController < ApplicationController
  before_action :set_wording, only: %i[show edit update destroy]

  def index
    @wordings = policy_scope(Wording).all
  end

  def show
  end

  def new
    @wording = Wording.new
  end

  def create
    @wording = Wording.new(wording_params)
    if @wording.save
      redirect_to wording_path(@wording)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @wording.update(wording_params)
      redirect_to wording_path(@wording)
    else
      render :edit
    end
  end

  def destroy
    @wording.destroy
    redirect_to wordings_path
  end

  private

  def set_wording
    @wording = policy_scope(Wording).find(params[:id])
  end

  def wording_params
    params.require(:wording).permit(:text, :level, :author)
  end
end
