class Lab < ActiveRecord::Base
   attr_accessible :id, :name
   has_many :teaching_assistants, as: :ta_duty
end
