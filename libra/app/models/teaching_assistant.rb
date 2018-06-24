class TeachingAssistant < ActiveRecord::Base
  attr_accessible :name, :ta_duty_id, :ta_duty_type
  belongs_to :ta_duty, polymorphic: true
end
