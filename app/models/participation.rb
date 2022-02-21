class Participation < ApplicationRecord

    ###PLUGINS###
    belongs_to :user
    belongs_to :event


    ###VALIDATES###

    ###CALLBACKS###
    after_create :join_event_send

    ###METHODS###
    def join_event_send
        AdminMailer.join_event_email(self).deliver_now
    end
  


end
