class UserMailer < ApplicationMailer

    default from: 'manukhalifa@hotmail.com'
       
    def welcome_email(user)
        @user = user 
        @url  = 'http://monsite.fr/login' 
        mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end
end
