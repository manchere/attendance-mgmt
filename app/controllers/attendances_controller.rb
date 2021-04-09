class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[ show edit update destroy ]

  # GET /attendances or /attendances.json
  def index
    @attendances = Attendance.all
  end

  # GET /attendances/1 or /attendances/1.json
  def show
  end

  # GET /attendances/new
  def new
    @attendance = Attendance.new
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances or /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)
    
    if get_user
        @attendance.user_id = get_user.id
        @attendance.present = true
        @attendance.status
        @attendance.datetime_of_presence = DateTime.now
      respond_to do |format|
        if @attendance.save
          format.html { redirect_to @attendance, notice: "You have successfully checked in." }
          format.json { render :show, status: :created, location: @attendance }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @attendance.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to new_user_path
      flash[:notice]
    end
  end

  # DELETE /attendances/1 or /attendances/1.json
  def destroy
    @attendance.destroy
    respond_to do |format|
      format.html { redirect_to attendances_url, notice: "Attendance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendance_params
      params.require(:attendance).permit(:present, :body_temperature, :user_id)
    end

    def get_user
      @user = User.find_by(phone_number: params[:phone_number])
    end
end
