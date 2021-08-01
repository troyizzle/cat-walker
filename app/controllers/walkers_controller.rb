# frozen_string_literal: true

class WalkersController < ApplicationController
  before_action :set_walker, only: %i[show edit update destroy]

  # GET /walkers or /walkers.json
  def index
    @walkers = Walker.all
  end

  # GET /walkers/1 or /walkers/1.json
  def show; end

  # GET /walkers/new
  def new
    @walker = Walker.new
  end

  # GET /walkers/1/edit
  def edit; end

  # POST /walkers or /walkers.json
  def create
    @walker = Walker.new(walker_params)

    respond_to do |format|
      if @walker.save
        format.html { redirect_to @walker, notice: "Walker was successfully created." }
        format.json { render :show, status: :created, location: @walker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @walker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /walkers/1 or /walkers/1.json
  def update
    respond_to do |format|
      if @walker.update(walker_params)
        format.html { redirect_to @walker, notice: "Walker was successfully updated." }
        format.json { render :show, status: :ok, location: @walker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @walker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /walkers/1 or /walkers/1.json
  def destroy
    @walker.destroy
    respond_to do |format|
      format.html { redirect_to walkers_url, notice: "Walker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_walker
    @walker = Walker.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def walker_params
    params.require(:walker).permit(:user_id, :terms, :zip, :range)
  end
end
