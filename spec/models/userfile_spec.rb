require 'rails_helper'

RSpec.describe Userfile, type: :model do
  it { should belong_to :profile }
  let(:user) { create(:user) }
  let(:profile) { create(:profile, user_id: user.id) }
  let!(:userfile) { create(:userfile, profile_id: profile.id) }

  it 'userfile have one attached file' do
    expect(userfile.attachment).to be_an_instance_of(ActiveStorage::Attached::One)
  end

  it 'validate files for userfile' do
    userfile = build(:userfile, attachment: Rack::Test::UploadedFile.new("#{Rails.root}/public/roboto-test.zip",
                                                           'application/zip'))
    expect(userfile).to be_valid

    userfile = build(:userfile, attachment: Rack::Test::UploadedFile.new("#{Rails.root}/public/apple-touch-icon.png",
                                                           'image/png'))
    expect(userfile).to_not be_valid
  end
end
