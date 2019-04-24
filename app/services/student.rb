class Student
  def initialize(last_name, first_name, email)
    @last_name = last_name
    @first_name = first_name
    @email = email
    @uuid = nil
  end

  attr_accessor :first_name, :last_name, :email, :uuid

  def name
    "#{last_name}, #{first_name}"
  end
end