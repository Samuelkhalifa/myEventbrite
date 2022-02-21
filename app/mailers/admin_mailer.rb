class AdminMailer < ApplicationMailer

    default from: 'manukhalifa@hotmail.com'
       
    def join_event_email(participation)
        @event = Event.find(participation.event_id)
        @admin = Admin.find(@event.admin_id)
        @user = User.find(participation.user_id)
        mail(to: @admin.email, subject: 'Votre évenement compte un nouvel inscrit !')
    end
end
