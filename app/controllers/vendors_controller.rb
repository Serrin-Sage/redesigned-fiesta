class VendorsController < ApplicationController

  def index
    render json: Vendor.all.to_json(only: [:id, :name])
  end

  def show
    vendor = Vendor.find_by(id: params[:id])
    if (vendor)
      render json: vendor
    else
      render json: {error: "Vendor not found"}, status: 422
    end
  end

  
end
