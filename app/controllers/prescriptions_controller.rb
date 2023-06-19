class PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.all
    # @prescriptions_json_array = @prescriptions.each do |prescription|
    #   prescription.to_json
    # end
  end

  def prescription_json
    render json: Prescription.all.map { |p| { name: p.name, status: p.status, dosage: p.dosage, frequency: p.frequency, doctor: "Dr. #{p.doctor.first_name} #{p.doctor.last_name}" } }
  end

  def show
    @prescription = Prescription.find(params[:id])
  end

  def new
    @prescription = Prescription.new
    @doctors = Doctor.all
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @doctor = Doctor.find(prescription_params[:doctor_id])
    if @prescription.save!
      redirect_to doctor_prescription_path(@doctor, @prescription)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @prescription = Prescription.find(params[:id])
    @doctors = Doctor.all
  end

  def update
    @prescription = Prescription.find(params[:id])
    @prescription.update(prescription_params)
    # no need for update view
    redirect_to doctor_prescription_path(@prescription)
  end

  def destroy
  end

  private

  def prescription_params
    params.require(:prescription).permit(:id, :name, :dosage, :frequency, :status, :end_time, :tablets, :doctor_id)
  end
end
