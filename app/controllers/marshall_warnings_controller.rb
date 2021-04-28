class MarshallWarningsController < ApplicationController
  before_action :set_marshall_warning, only: %i[ show edit update destroy ]
  #before_action :authenticate_user!
  
  # GET /marshall_warnings or /marshall_warnings.json
  def index
    @marshall_warnings = MarshallWarning.all
  end

  # GET /marshall_warnings/1 or /marshall_warnings/1.json
  def show
  end

  # GET /marshall_warnings/new
  def new
    @marshall_warning = MarshallWarning.new
  end

  # GET /marshall_warnings/1/edit
  def edit
  end

  # POST /marshall_warnings or /marshall_warnings.json
  def create
    @marshall_warning = MarshallWarning.new(marshall_warning_params)

    respond_to do |format|
      if @marshall_warning.save
        format.html { redirect_to @marshall_warning, notice: "Marshall warning was successfully created." }
        format.json { render :show, status: :created, location: @marshall_warning }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @marshall_warning.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /marshall_warnings/1 or /marshall_warnings/1.json
  def update
    respond_to do |format|
      if @marshall_warning.update(marshall_warning_params)
        format.html { redirect_to @marshall_warning, notice: "Marshall warning was successfully updated." }
        format.json { render :show, status: :ok, location: @marshall_warning }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @marshall_warning.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /marshall_warnings/1 or /marshall_warnings/1.json
  def destroy
    @marshall_warning.destroy
    respond_to do |format|
      format.html { redirect_to marshall_warnings_url, notice: "Marshall warning was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end


  def search 
    #column_dsp = MarshallWarning.where("dsp ILIKE ?", "%" + params[:q] + "%" )
    column_registration_number = MarshallWarning.where("registration_number ILIKE ?", "%" + params[:q] + "%" )
    @marshall_warnings = MarshallWarning.where("dsp ILIKE ?", "%" + params[:q] + "%" ).or(column_registration_number) 
    # Based on ImportExcel2 project
  end 


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marshall_warning
      @marshall_warning = MarshallWarning.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def marshall_warning_params
      params.require(:marshall_warning).permit(:dsp, :registration_number, :fault, :action_comment, :date)
    end
end
