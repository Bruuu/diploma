class Sprint
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :project
  has_many :tasks, dependent: :destroy

  field     :name, type: String
  validates :name, presence: true, uniqueness: { scope: :project_id, case_sensitive: false }

  field     :start_date, type: Date
  validates :start_date,
            presence: true

  field     :end_date,   type: Date
  validates :end_date,
            presence: true
end
