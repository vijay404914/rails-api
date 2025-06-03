class Api::V1::ChallangesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_challange, only: [:show, :update, :destroy]

  # GET /api/v1/challanges
  def index
    @challanges = Challange.all
    render json: @challanges
  end

  # GET /api/v1/challanges/:id
  def show
    render json: @challange
  end

  # POST /api/v1/challanges
  def create
    @challange = current_user.challanges.build(challange_params)
    if @challange.save
      render json: @challange, status: :created
    else
      render json: @challange.errors, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /api/v1/challanges/:id
  def update
    if @challange.update(challange_params)
      render json: @challange
    else
      render json: @challange.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/challanges/:id
  def destroy
    @challange.destroy
    head :no_content
  end

  private

  def set_challange
    @challange = Challange.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Challange not found" }, status: :not_found
  end

  def challange_params
    params.require(:challange).permit(:title, :description)
  end
end
