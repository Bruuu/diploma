class User
  include Mongoid::Document
  include Mongoid::Timestamps

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  field :first_name,             :type => String
  field :second_name,            :type => String
  field :email,                  :type => String,  :default => ""
  field :encrypted_password,     :type => String,  :default => ""
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time
  field :remember_created_at,    :type => Time
  field :sign_in_count,          :type => Integer, :default => 0
  field :current_sign_in_at,     :type => Time
  field :last_sign_in_at,        :type => Time
  field :current_sign_in_ip,     :type => String
  field :last_sign_in_ip,        :type => String
  field :locale,                 :type => String


  has_many :projects
  has_many :tasks
  def full_name
    [first_name, second_name].join(" ")
  end
end
