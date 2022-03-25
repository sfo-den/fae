require 'rails_helper'

describe 'deploy#index' do

  context 'when role is super admin' do
    before do
      super_admin_login
    end

    it 'should be able to access deploy' do
      get fae.deploy_path

      expect(response.status).to eq(200)
    end
  end

  context 'when role is admin' do
    before do
      admin_login
    end

    it 'should be able to access deploy' do
      get fae.deploy_path

      expect(response.status).to eq(200)
    end
  end

  context 'when role is user' do
    before do
      user_login
    end

    it 'should not be able to access deploy' do
      get fae.deploy_path

      expect(response.status).to eq(302)
      expect(response).to redirect_to(fae.root_path)
    end
  end

  context 'when logged out' do
    it "shouldn't be able to access deploy" do
      create_super_user
      get fae.deploy_path

      expect(response.status).to eq(302)
      expect(response).to redirect_to('/admin/login')
    end
  end

end
