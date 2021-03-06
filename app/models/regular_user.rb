class RegularUser < User
  attr_accessible :email, :password, :password_confirmation

  attr_accessor :password

  before_save :encrypt_password
  before_update :encrypt_password_update

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create

  validates :email, :format => /@/
  validates :password, :length => 5..20
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.model_name
    User.model_name
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    logger.info "Starting to encrypt_password"
    if password.present?
      logger.info "password is present so encrypt_password"
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def encrypt_password_update
    logger.info("YO! RegularUser")
    if password.present?
      logger.info "password is present so encrypt_password"
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end


end
