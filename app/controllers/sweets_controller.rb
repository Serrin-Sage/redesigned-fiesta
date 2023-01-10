class SweetsController < ApplicationController

  def index 
    render json: Sweet.all
  end

  def show
    sweet = Sweet.find_by(id: params[:id])
    if (sweet)
      render json: sweet
    else
      render json: {error: "Sweet not found"}, status: 422
    end
  end
  
end
