class PrescriptionsController < ApplicationController
  def index
    @prescriptions = Prescription.all
    @prescription = Prescription.new

    @upcoming_refills = @prescriptions.select do |p|
      # Check if tablets and frequency are not nil
      if p.tablets.present? && p.frequency.present?
        # Assuming frequency is in tablets per day
        days_remaining = (p.tablets / p.frequency.to_f).ceil
        p.end_time - days_remaining.days <= Date.today
      else
        false
      end
    end
    add_recommendation_to_team(@prescriptions) if params[:recommendation].present?
  end


  def prescription_json
    render json: Prescription.all.map { |p| { name: p.name, status: p.status, dosage: p.dosage, frequency: p.frequency, doctor: "Dr. #{p.doctor.first_name} #{p.doctor.last_name}", purpose: p.purpose, id: p.id } }
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
    @prescription.doctor = @doctor
    if @prescription.save!
      redirect_to prescriptions_path, alert: "your prescription was added"
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
    @prescription = Prescription.find(params[:id])
    @prescription.destroy
    respond_to do |format|
      format.json { render json: {message: "deleted properly"}, formats: [:json] }
    end
  end

  def download
    @prescriptions = Prescription.all
    respond_to do |format|
      format.csv { send_data @prescriptions.to_csv, filename: "prescriptions-#{Date.today}.csv" }
    end
  end

  private

  def prescription_params
    params.require(:prescription).permit(:id, :name, :dosage, :frequency, :status, :end_time, :tablets, :doctor_id, :purpose)
  end

  def add_recommendation_to_team(prescriptions)
    recommendation = gpt4_service.content_recommendation(prescriptions)
    team = current_user.team
    team.update(recommendation: recommendation)
    render turbo_stream: turbo_stream.update("openai_recommendation", partial: "prescriptions/turbo_frames/openai_recommendation")
  end

  def gpt4_service
    client = OpenAI::Client.new
    @gpt4_service ||= Gpt4Service.new(client)
  end
end
