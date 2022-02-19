class Event < ApplicationRecord

    ###PLUGINS###
    has_many :participations
    has_many :users, through: :participations
    belongs_to :user, foreign_key: "admin_number", class_name: "User", optional: true


    ###VALIDATES###
    validates :start_date,
        presence: true

    validates :duration,
        presence: true
        #length: { greater_than: 0 }
        #numericality: { % 5 => 0 }

    validates :title,
        presence: true
        #length: { in: 5..140 }

    validates :description,
        presence: true
        #length: { in: 200..1000 }
    
     validates :price,
        presence: true
        #numericality: { in: 1..1000 }
    
    validates :location,
        presence: true


end
