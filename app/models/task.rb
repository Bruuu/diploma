# coding: utf-8
class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  TRACKERS = ["Bug", "Feature", "Support"]
  STATUSES = ["Новый", "В работе", "Выполнено"]
  PRIORITIES = ["Низкий", "Нормальный", "Высокий", "Незамедлительный"]

  belongs_to :sprint
  belongs_to :project

  field     :name, type: String
  validates :name,
            presence: true,
            uniqueness: { scope: :project_id, case_sensitive: false }

  field     :description, type: String
  validates :description,
            length: { maximum: 500 }

  field     :tracker, type: String
  validates :tracker,
            presence: true,
            inclusion: { in: TRACKERS }

  field     :status, type: String
  validates :status,
            presence: true,
            inclusion: { in: STATUSES }

  field     :priority, type: String
  validates :priority,
            presence: true,
            inclusion: { in: PRIORITIES }

  field     :assignee, type: Integer

  field     :start_date, type: Date

  field     :due_date, type: Date

  field     :estimated_time, type: Time

  field     :done, type: Integer, default: 0
  validates :done,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100, only_integer: true }
end
