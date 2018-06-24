class PolymorphicController < ApplicationController
	before_filter :authenticate_user!
	layout 'standard'

	def viewTeacherPerCourse
		@ta = TeachingAssistant.all
		@course = Course.all
	end

	def assignTeacherPerCourse
		params[:user_id].to_a.each do |key,val|
			course = Course.find_by_id(val.first.to_i)
        	TeachingAssistant.where(:id => key.to_i).update_all(:ta_duty_id => course.id, :ta_duty_type => "course")
    	end
    	redirect_to :root
	end


	def viewTeacherPerLab
		@ta = TeachingAssistant.all
		@lab = Lab.all
	end

	def AssignTeacherPerLab
		params[:user_id].to_a.each do |key,val|
			lab = Lab.find_by_id(val.first.to_i)
        	TeachingAssistant.where(:id => key.to_i).update_all(:ta_duty_id => lab.id, :ta_duty_type => "lab")
    	end
    	redirect_to :root
	end
end
