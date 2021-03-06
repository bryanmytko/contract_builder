class User < ActiveRecord::Base

    attr_accessible :email, :password, :user_type
    attr_accessor :password
    
    before_save :encrypt_password
    
    validates_presence_of :password, :on => :create
    validates_presence_of :email, :on => :create
    
    def self.authenticate(email,password)
        user = find_by_email(email)
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
            user
        else
            nil
        end
    end
    
    def self.auth_admin(email)
      user = find_by_email(email)
      if user.user_type == 'admin'
        user
      else
        nil
      end
    end
    
    def encrypt_password
        if password.present?
            self.password_salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
    end
end
