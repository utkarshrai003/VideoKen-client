class DashboardController < ApplicationController

  def show
    @doctors = [{id: 1, name: "Dr. Panchayat"}, {id: 2, name: "Dr. Gulati"}]
    @patients = [{id: 1, name: "Ram Lal"}, {id: 2, name: "Bilal Saed"}]
  end

end
