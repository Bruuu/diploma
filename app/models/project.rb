class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  has_many :sprints, dependent: :destroy
  has_many :tasks, dependent: :destroy

  field     :name, type: String
  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false }

  field     :description, type: String
  validates :description,
            length: { maximum: 500 }
end
