class UserMailer < ActionMailer::Base
  	default from: 'heyahapp@gmail.com'

	def welcome_message(user)
		@user = user
		mail(to: @user.email, subject: "Welcome to Heyah, #{user.name}")
	end

	def event_start(event, user)
		@event = event
		@user = user
		mail(to: @user.email, subject: "The conversation at #{event.name} has started!")
	end
end
