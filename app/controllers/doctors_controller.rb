class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all.order(created_at: :desc)
    @addresses = @doctors.geocoded.map do |doctor|
      {
        lat: doctor.latitude,
        lng: doctor.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {doctor: doctor})
      }
    end
    @doctor = Doctor.new
    @mapbox_token = ENV["MAPBOX_TOKEN"]
  end

  def show
    @doctor = Doctor.find(params[:id])
    @mapbox_token = ENV["MAPBOX_TOKEN"]
  end

  # def new
  # end

  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.user = current_user
    if @doctor.save!
      redirect_to doctors_path
    end

  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    @doctor.update(doctor_params)
    # No need for app/views/doctors/update.html.erb
    redirect_to doctors_path
  end

  def destroy
  end

  private

  def doctor_params
    params.require(:doctor).permit(:id, :specialty, :address, :phone_number, :first_name, :last_name, :hospital)
  end

end
