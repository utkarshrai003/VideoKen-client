class DashboardController < ApplicationController

  # Endpoint to display DashBoard for VideoKen-client
  # Fetches relevant data by making an api call to VideoKem-server
  def show
    @patients = ApiCall.new('api/v1/patients', :get).make_call
    @doctors = ApiCall.new('api/v1/physicians', :get).make_call
    @appointments = ApiCall.new('api/v1/appointments', :get).make_call
  rescue
    render :template => "errors/server_unavailable"
  end

  # Endpoint to create a user(patient/doctor)
  # Makes a call to VideKen-server with parameters
  def create_user
    response = ApiCall.new('api/v1/users', :post, patient_params).make_call
    flash["notice"] = response["error"] ? response["error"] : "User created successfully."
    redirect_to('/')
  rescue
    render :template => "errors/server_unavailable"
  end

  # Endpoint to create an appointment between patient and doctor
  # Makes a call to VideKen-server with parameters
  def create_appointment
    response = ApiCall.new('api/v1/appointments', :post, appointment_params).make_call
    flash["notice"] = response["error"] ? response["error"] : "Appointment created successfully."
    redirect_to('/')
  rescue
    render :template => "errors/server_unavailable"
  end

  private

  def patient_params
    params.permit(:name, :email, :number, :role, :specialization)
  end

  def appointment_params
    params.permit(:patient_id, :physician_id, :diseases)
  end

end
