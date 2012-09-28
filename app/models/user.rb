class User < ActiveRecord::Base
  has_many :registrations

  attr_accessible :name

  def self.register(auth)
    create! do |user|
      registration = Registration.create!(:provider => auth['provider'], 
                                          :uid => auth['uid'])
      user.name = auth['user_info']['joe']
      user.registrations << registration
    end
  end

  def self.lookup(auth)
    registration = Registration.find_by_auth(auth)
    return registration.user
  end
end
