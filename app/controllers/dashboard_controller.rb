class DashboardController < ApplicationController

  def show
    @doctors = [{id: 1, name: "Dr. Panchayat"}, {id: 2, name: "Dr. Gulati"}]
    @patients = [{id: 1, name: "Ram Lal"}, {id: 2, name: "Bilal Saed"}]
  end

  def create_user
    response = ApiCall.new('api/v1/users', patient_params, :post).make_call
    if response["error"]
      flash["error"] = response["error"]
    else
      flash["error"] = "Created successfully"
    end
    redirect_to dashboard_path
  end

  def create_appointment
  end

  private

  def patient_params
    params.permit(:name, :email, :number, :role, :specialization)
  end

end
