# class SessionsController < Devise::SessionsController
#   def create
#     if current_artist.nil?
#       self.resource = warden.authenticate(auth_options)
#       resource_name = self.resource_name
#     end
#
#     if resource.nil?
#       resource_name = :artist
#       request.params[:artist] = params[:gallery]
#
#       self.resource = warden.authenticate!(auth_options.merge(scope: :artist))
#     end
#
#     sign_in(resource_name, resource)
#     respond_with resource, :location => after_sign_in_path_for(resource)
#   end
# end
