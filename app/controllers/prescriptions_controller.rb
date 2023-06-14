class PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.all
  end

  def show
    @prescription = Prescription.find(params[:id])
  end

  def new
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @doctor = Doctor.find(params[:doctor_id])
    @prescription.doctor = @doctor
    if @prescription.save!
      redirect_to prescription_path(@prescription)
    else
      redirect_to new_prescription_path(@prescription)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def prescription_params
    params.require(:prescription).permit(:id, :specialty, :address, :phone_number, :first_name, :last_name)
  end
end
