require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:profile) { create(:profile, user_id: user.id) }


  describe 'GET #show' do
    context 'Authenticated user' do
      before :each do
        login(user)
      end

      it 'the user has access to his profile' do
        get :show, params: { id: profile }
        expect(assigns(:profile).user).to eq user
      end

      it "user can view another user's profile" do
        get :show, params: { id: profile }
        expect(assigns(:profile).user).to_not eq other_user
      end
    end

    context 'Unauthenticated user' do
      it 'does not save a new profile in the database' do
        get :show, params: { id: profile }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
