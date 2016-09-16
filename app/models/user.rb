class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

   def self.from_omniauth(access_token)
     data = access_token.info
     user = User.where(:email => data["email"]).first
     unless user
         user = User.create(name: data["name"],
            email: data["email"],
            image: data["image"],
            password: Devise.friendly_token[0,20]
         )
     end
     unless user.name
       user.name = data["name"]
     end
     user.image = data["image"]
     user.save
     user
   end
end
