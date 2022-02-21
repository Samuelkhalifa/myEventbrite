class User < ApplicationRecord

    ###PLUGINS###
    has_many :participations
    has_many :events, through: :participations


    ###VALIDATES###


    ###CALLBACKS###
    after_create :welcome_send


    ###METHODS###
    def welcome_send
        UserMailer.welcome_email(self).deliver_now
    end
     

end
