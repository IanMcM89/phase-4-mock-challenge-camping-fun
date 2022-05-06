class SignupsController < ApplicationController

  def create
    signup = Signup.create!(signup_params)
    signup_activity = signup.activity
    render json: signup_activity, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
  
  private

  def signup_params
    params.permit(:camper_id, :activity_id, :time)
  end
end
