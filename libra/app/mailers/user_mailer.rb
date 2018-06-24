class UserMailer < ActionMailer::Base
	default from: "abhichauhan119@gmail.com"

	def welcome_email(mail_to)
		@mail_to = mail_to
    	mail(to: @mail_to,
         body: "Hello " + @mail_to + " Sir, Your Book Has been Viewed in Library",
         content_type: "text/html",
         subject: "YOur Book Has Been Viewed")
 	 end


 	 def custom_email(body, subject)
		@mail_to = "abhichauhan119@gmail.com"
    	mail(to: @mail_to,
         body: "Hello " + @mail_to + body,
         content_type: "text/html",
         subject: subject)
 	 end
end
