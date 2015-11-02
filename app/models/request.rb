class Request < ActiveRecord::Base
  validates(:name, presence: true)
  validates(:email, presence: true)
  validates(:done, presence: true)

  after_initialize :set_default_values

  private
  def set_default_values
    self.done ||= false
  end
end
