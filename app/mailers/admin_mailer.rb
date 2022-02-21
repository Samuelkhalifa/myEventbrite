class AdminMailer < ApplicationMailer

    default from: 'manukhalifa@hotmail.com'
       
    def join_event_email(user, event)
        @user = user 
        @event  = event
        mail(to: @user.email, subject: 'Votre évenement vous attends !') 
    end
end
