class ApplicantsController < ApplicationController
  before_action :set_applicant, only: [:show, :edit, :update]

  #no index, we don't want an admin

  # GET /applicants/1
  # GET /applicants/1.json
  def show
  end

  # GET /applicants/new
  def new
    @applicant = Applicant.new
  end

  #go to elegibility page
  def elegibility
  end

  #applicants said they were elegible
  def check_elegibility
    redirect_to applySuccess_applicants_path
  end

  #go to applySuccess page
  def applySuccess
  end

  # GET /applicants/1/edit
  def edit
  end

  # POST /applicants
  # POST /applicants.json
  def create
    @applicant = Applicant.new(applicant_params)

    respond_to do |format|
      if @applicant.save
        session[:current_user]= @applicant 

        #redirect to elegibility and background check
        format.html { redirect_to elegibility_applicants_path, notice: 'Applicant was successfully created.' }
        format.json { render :show, status: :created, location: @applicant }
      else
        format.html { render :new }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applicants/1
  # PATCH/PUT /applicants/1.json
  def update
    respond_to do |format|
      if @applicant.update(applicant_params)
        format.html { redirect_to @applicant, notice: 'Applicant was successfully updated.' }
        format.json { render :show, status: :ok, location: @applicant }
      else
        format.html { render :edit }
        format.json { render json: @applicant.errors, status: :unprocessable_entity }
      end
    end
  end


  def searchApplication
  end

  def search
    @applicant = Applicant.find_by_email(params[:email])
    Rails.logger.debug("My object: #{@applicant.inspect}")
    if @applicant.nil?
      render action: 'searchApplication', notice: 'Could not find your application'
    else
      redirect_to @applicant
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant
      @applicant = Applicant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def applicant_params
      params.require(:applicant).permit(:first_name, :last_name, :region, :phone, :email, :phone_type)
    end
end
