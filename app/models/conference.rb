class Conference < ActiveRecord::Base
  attr_accessible :name, :starts_at, :url
end
