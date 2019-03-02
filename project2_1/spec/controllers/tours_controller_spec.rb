require 'rails_helper'


RSpec.describe ToursController, type: :controller do

  context 'before log in' do

    it "allows index access" do
      # @request.env['devise.mapping'] = Devise.mappings[:admin]
      # sign_in @user, scope: :admin
      get :index

      expect(response).to be_success
    end

  end

  context 'after log in' do

    it "allows new tour access" do

      user = double('user', :role=>'admin')
      allow(request.env['warden']).to receive(:authenticate!).and_return(user)
      allow(controller).to receive(:current_user).and_return(user)

      get :new

      expect(response).to be_success

    end


    # it "allows create tour" do
    #
    #
    #   user = double('user', :role=>'admin')
    #   allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    #   allow(controller).to receive(:current_user).and_return(user)
    #
    #   post :create, :params => { :tour => { :name => "Any Name" } }
    #
    #
    #   expect(response).to be_fail
    #
    # end



  end


end
