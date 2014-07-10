require 'rails_helper'

describe MessagesController do
  describe 'GET new' do
    it 'renders new message form' do
      get :new
      expect(response).to render_template 'new'
    end

    it 'assigns @message' do
      get :new
      expect(assigns(:message)).to be_an_instance_of(Message)
    end
  end

  describe 'POST create' do
    context 'valid message' do
      def post_valid_message
        post :create, message: attributes_for(:message)
      end

      it 'creates new message' do
        expect { post_valid_message }.to change { Message.count }.by(1)
      end
    end
  end
end
