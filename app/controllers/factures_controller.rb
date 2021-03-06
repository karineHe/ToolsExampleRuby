class FacturesController < ApplicationController
  before_action :set_facture, only: [:show, :edit, :update, :destroy, :create_pdf, :add_ref, :set_ref, :update_status]

  # GET /factures
  # GET /factures.json
  def index
    @factures = Facture.all
  end

  def create_pdf
    respond_to do |format|
      format.pdf do
        pdf = GeneratePdf.new(@facture)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf', :disposition => 'inline'
      end
    end
  end

  # GET /factures/1
  # GET /factures/1.json
  def show
  end

  # GET /factures/new
  def new
    @facture = Facture.new
  end

  # GET /factures/1/edit
  def edit
  end

  def add_ref
    @assignment = Assignment.new
  end

  def set_ref
    @assignment = Assignment.new(assignment_params)
    @assignment.facture = @facture

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to add_ref_path(@facture) }
        format.json { render :add_ref, status: :created, location: @facture }
      else
        format.html { redirect_to add_ref_path(@facture) }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /factures
  # POST /factures.json
  def create
    @facture = Facture.new(facture_params)

    respond_to do |format|
      if @facture.save
        format.html { redirect_to add_ref_path(@facture), notice: 'La facture a bien été créée.'} 
        format.json { render :add_ref, status: :created, location: @facture }
      else
        format.html { render :new }
        format.json { render json: @facture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_status
    @facture.change_status
    respond_to do |format|
      if @facture.save
        format.html { redirect_to factures_url}
        format.json { render :show, status: :ok, location: @facture }
      else
        format.html { render :edit }
        format.json { render json: @facture.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /factures/1
  # PATCH/PUT /factures/1.json
  def update
    respond_to do |format|
      if @facture.update(facture_params)
        format.html { redirect_to add_ref_path(@facture), notice: 'La facture a bien été mise à jour.' }
        format.json { render :show, status: :ok, location: @facture }
      else
        format.html { render :edit }
        format.json { render json: @facture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factures/1
  # DELETE /factures/1.json
  def destroy
    @facture.destroy
    respond_to do |format|
      format.html { redirect_to factures_url, notice: 'La facture a bien été supprimée.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facture
      @facture = Facture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facture_params
      params.require(:facture).permit(:comp_name, :lname, :objet, :emetteur)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:ref_id, :qty)
    end
end
