class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all.order(created_at: :desc)
    @doctor = Doctor.new
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  # def new
  # end

  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.user = current_user
    if @doctor.save!
      redirect_to doctor_path(@doctor)
    else
      redirect_to new_doctor_path(@doctor)
    end

  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    @doctor.update(doctor_params)
    # No need for app/views/doctors/update.html.erb
    redirect_to doctor_path(@doctor)
  end

  def destroy
  end

  private

  def doctor_params
    params.require(:doctor).permit(:id, :specialty, :address, :phone_number, :first_name, :last_name)
  end

end
