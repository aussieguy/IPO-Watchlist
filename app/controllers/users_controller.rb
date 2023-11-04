class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users/new
  def new
  #  User.delete_all
    @user = User.new
  end

  # GET /user/:id
  def show
  end

  # POST /users or /users.json
  def create
    # Check if the user exists and if so delete them else create them.  This is how we implement
    # the unsubscribe feature.
    if User.exists?(user_params)  
      User.destroy_by(user_params)
      redirect_to "/"
    else  
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save        

          # Send an email saying welcome to the new user.  Send asynchronously via .deliver_later or send synchronously via .deliver_now
          # UserMailer is found in mailers/user_mailer.rb
          NotifierMailer.signup_confirmation(@user.email).deliver_later

          # Send the new user the latest newsletter.
          ListingMailer.listing(@user.email).deliver_later
          
          format.html { redirect_to "/" }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end # if loop
      end # do loop  
    end # if loop
  end # create

  # DELETE 
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to "/", notice: "Sorry to see you go." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email)
    end
end
