class Project
  include Mongoid::Document
  field :name, type: String
  field :descripion, type: String
end
