class Nieto
  include Mongoid::Document

  embedded_in :nino

  field :name, type: String
end
