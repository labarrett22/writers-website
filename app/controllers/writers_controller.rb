class WritersController < ApplicationController

  def new
    @writer = Writer.new
  end

  def create
    @writer = Writer.new(writer_params)
    if @writer.save
      redirect_to writer_path(@writer)
    else
      flash.now[:error] = "Failed to create writer"
      render :new
    end
  end

  def show
    @writer = Writer.find(params[:id])
  end

  def edit
    @writer = Writer.find(params[:id])
  end

  def update
    @writer = Writer.find(params[:id])
    if @writer.update(writer_params)
      redirect_to writer_path(@writer)
    else
      flash.now[:error] = "Failed to update writer"
      render :edit
    end
  end

  private

  def writer_params
    params.require(:writer).permit(:twitter, :full_name, :bio, :location, :birthdate)
  end
end
