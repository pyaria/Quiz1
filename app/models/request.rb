class Request < ActiveRecord::Base
  validates(:name, presence: true)
  validates(:email, presence: true)

  after_initialize :set_default_values

  private
  def set_default_values
    self.done ||= false
  end

  def self.search(search)
    where("name ILIKE? OR email ILIKE? OR message ILIKE?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
