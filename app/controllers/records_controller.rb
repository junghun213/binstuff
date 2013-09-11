class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  # GET /records
  # GET /records.json

  helper_method :sort_column, :sort_direction

  def index
    @record = Record.new
    # @records = Record.all
    @records = Record.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])

  end

  # GET /records/1
  # GET /records/1.json
  def show
  end

  # GET /records/new
  def new
    
  end

  # GET /records/1/edit
  def edit
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)
    # if @record.save
    #   redirect_to :back
    # end
    respond_to do |format|
      if @record.save
        format.html { redirect_to records_url, notice: 'Record was successfully created.' }
        # format.html { redirect_to @record, notice: 'Record was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @record }
      else
        format.html { redirect_to records_url, notice: 'Please upload a file.' }
        # format.html { render action: 'new' }
        # format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to @record, notice: 'Record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:name, :description, :user_id, :stuff)
    end

    def sort_column
      params[:sort] || "stuff_file_name"
    end

    def sort_direction
      params[:direction] || "asc"
    end
end
