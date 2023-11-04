class AsxlistingsController < ApplicationController
  before_action :set_asxlisting, only: %i[ show edit update destroy ]

  # GET /asxlistings or /asxlistings.json
  def index
    @asxlistings = Asxlisting.order(:company) # Retrieve in alphabetical order 
  end

  # GET /asxlistings/1 or /asxlistings/1.json
  def show
  end

  # GET /asxlistings/new
  def new
    @asxlisting = Asxlisting.new
  end

  # GET /asxlistings/1/edit
  def edit
  end

  # POST /asxlistings or /asxlistings.json
  def create
    @asxlisting = Asxlisting.new(asxlisting_params)

    respond_to do |format|
      if @asxlisting.save
        format.html { redirect_to asxlisting_url(@asxlisting), notice: "Asxlisting was successfully created." }
        format.json { render :show, status: :created, location: @asxlisting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @asxlisting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asxlistings/1 or /asxlistings/1.json
  def update
    respond_to do |format|
      if @asxlisting.update(asxlisting_params)
        format.html { redirect_to asxlisting_url(@asxlisting), notice: "Asxlisting was successfully updated." }
        format.json { render :show, status: :ok, location: @asxlisting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @asxlisting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asxlistings/1 or /asxlistings/1.json
  def destroy
    @asxlisting.destroy

    respond_to do |format|
      format.html { redirect_to asxlistings_url, notice: "Asxlisting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asxlisting
      @asxlisting = Asxlisting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def asxlisting_params
      params.require(:asxlisting).permit(:code, :company, :date, :listingPrice, :currentPrice)
    end
end
