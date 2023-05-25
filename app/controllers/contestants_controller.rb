class ContestantsController < ApplicationController
  before_action :set_contestant, only: %i[ show edit update destroy ]

  # GET /contestants or /contestants.json
  def index
    @contestants = Contestant.all
  end

  # GET /contestants/1 or /contestants/1.json
  def show
  end

  # GET /contestants/new
  def new
    @contestant = Contestant.new
  end

  # GET /contestants/1/edit
  def edit
  end

  # POST /contestants or /contestants.json
  def create
    @contestant = Contestant.new(contestant_params)

    respond_to do |format|
      if @contestant.save
        format.html { redirect_to contestant_url(@contestant), notice: "Contestant was successfully created." }
        format.json { render :show, status: :created, location: @contestant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contestant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contestants/1 or /contestants/1.json
  def update
    respond_to do |format|
      if @contestant.update(contestant_params)
        format.html { redirect_to contestant_url(@contestant), notice: "Contestant was successfully updated." }
        format.json { render :show, status: :ok, location: @contestant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contestant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contestants/1 or /contestants/1.json
  def destroy
    @contestant.destroy

    respond_to do |format|
      format.html { redirect_to contestants_url, notice: "Contestant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contestant
      @contestant = Contestant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contestant_params
      params.fetch(:contestant, {})
    end
end
