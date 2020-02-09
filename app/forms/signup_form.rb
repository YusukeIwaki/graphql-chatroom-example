class SignupForm
  include ActiveModel::Model, ActiveModel::Attributes

  attribute :display_name, :string
  attribute :email, :string
  attribute :real_name, :string

  if defined?(Faker)
    def self.random
      SignupForm.new.tap do |f|
        f.display_name = Faker::Internet.username
        f.email = Faker::Internet.free_email
        f.real_name = Faker::Name.name_with_middle
      end
    end
  end

  def valid?
    user = User.new
    public_profile = user.build_public_profile(display_name: display_name)
    private_profile = user.build_private_profile(email: email, real_name: real_name)

    if public_profile.invalid?
      public_profile.errors.each do |attr_name, error|
        errors.add(attr_name, error)
      end
    end
    if private_profile.invalid?
      private_profile.errors.each do |attr_name, error|
        errors.add(attr_name, error)
      end
    end

    errors.empty?
  end

  def signup
    user = User.new
    public_profile = user.build_public_profile(display_name: display_name)
    private_profile = user.build_private_profile(email: email, real_name: real_name)
    user.save!
  end
end
