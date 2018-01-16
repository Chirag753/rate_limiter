class RequestLimit < ActiveRecord::Base

  MAX_LIMIT=100.freeze


  #### Method which is Scheduled Every Hour To Reset The number of requests ####
  def self.clear_old_records
    RequestLimit.all.destroy_all
  end
  ######### Scheduled Every 1 hour at 00 minutes using whenever gem ############

end
