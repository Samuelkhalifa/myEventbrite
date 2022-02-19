class User < ApplicationRecord

    ###PLUGINS###
    has_many :participations
    has_many :events, through: :participations


    ###VALIDATES###

      
        

end
