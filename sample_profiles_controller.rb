class ProfilesController < ApplicationController
attr_accessor :profile
skip_before_filter :verify_authenticity_token


 def show
 	@profile = User.find(params[:id])
 	@profile_data = Profile.where()

 end

 def new
 	@profile = Profile.new
 	@profile.build_user

 end

 def create
 	@profile = current_user.profile

 	
 	
 	
 	redirect_to(root_path, :notice => "Message was successfully sent.")


 end

 
 def update
 	@profile = Profile.find(params[:id])

 	respond_to do |format|
 		if @profile.update_attributes(profile_params)
 			format.html { redirect_to root_path, notice: 'Post was successfully updated.' }
      		format.json { head :no_content }
 		end
 	end


 	@profile.update(profile_params)
 	


 end

 def edit

 	@profile = current_user.profiles.find(params[:user_id])

 end

 # Allowing certain parameters through.
 def profile_params
      params.require(:profile).permit(:avatar, :age, :from, :heightfeet, :heightinches, :weight)
 end

end
