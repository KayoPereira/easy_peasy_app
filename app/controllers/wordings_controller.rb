class WordingsController < ApplicationController
  before_action :set_wording, only: %i[show edit update destroy]

  def index
    @wordings = Wording.all
    authorize @wordings
  end

  def show
  end

  def new
    @wording = Wording.new
    authorize @wording
  end

  def create
    @wording = Wording.new(wording_params)
    authorize @wording
    if @wording.save
      redirect_to wording_path(@wording)
    else
      render :new
    end
  end

  def edit
    authorize @wording
  end

  def update
    authorize @wording
    if @wording.update(wording_params)
      redirect_to wording_path(@wording)
    else
      render :edit
    end
  end

  def destroy
    authorize @wording
    @wording.destroy
    redirect_to wordings_path
  end

  private

  def set_wording
    @wording = Wording.find(params[:id])
  end

  def wording_params
    params.require(:wording).permit(:text, :level, :author)
  end
end
