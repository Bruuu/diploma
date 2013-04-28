class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  has_many :sprints, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :members, dependent: :destroy

  def users
    members.map(&:user)
  end

  field     :name, type: String
  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false }

  field     :description, type: String
  validates :description,
            length: { maximum: 500 }
end
