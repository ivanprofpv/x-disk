require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one :profile }

  it 'validates username length' do
    FactoryBot.build(:user, username: "12345678901234567890
                                            12345678901234567890
                                            ").should_not be_valid
    FactoryBot.build(:user, username: '12345678').should be_valid
  end
end
