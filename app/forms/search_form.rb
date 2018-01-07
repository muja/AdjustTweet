class SearchForm
  include ActiveModel::Model

  attr_accessor :query, :count
  validates :query, presence: true

  def persisted?
    false
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "search")
  end
end
