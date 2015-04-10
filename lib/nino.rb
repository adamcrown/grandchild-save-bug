class Nino
  include Mongoid::Document

  embedded_in :padre
  embeds_many :nietos

  field :name, type: String
end
