require 'json'
module AutoCompletesControllerPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    # Wraps the association to get the Deliverable subject.  Needed for the 
    # Query and filtering
    def autocomplete_mention_user
      @users = User.logged.select("id, login, firstname, lastname")
      
      render :json => @users
    end
  end
end

AutoCompletesController.send(:include, AutoCompletesControllerPatch)
