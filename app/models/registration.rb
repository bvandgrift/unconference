class Registration < ActiveRecord::Base
  belongs_to :user

  attr_accessible :provider, :uid, :user_id

  def self.find_by_auth(auth)
    find_by_provider_and_uid(auth['provider'],auth['uid'])
  end
end
