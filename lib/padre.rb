class Padre
  include Mongoid::Document

  embeds_many :ninos

  field :name, type: String
end
