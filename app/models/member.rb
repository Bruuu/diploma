# coding: utf-8
class Member
  include Mongoid::Document
  include Mongoid::Timestamps
  ROLES = %w(Руководитель Менеджер Исполнитель Заказчик)
  field :role, type: String
  validates :role,
            presence: true,
            inclusion: { in: ROLES }

  belongs_to :user
  belongs_to :project
end
