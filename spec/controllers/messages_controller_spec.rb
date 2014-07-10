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
    context 'not draft' do
      context 'valid message' do
        def post_valid_message
          post :create, message: attributes_for(:message)
        end

        it 'creates new message' do
          expect { post_valid_message }.to change { Message.count }.by(1)
        end

        it 'redirects to the new message form' do
          post_valid_message
          expect(response).to redirect_to new_message_url
        end
      end

      context 'invalid message' do
        def post_invalid_message
          post :create, message: attributes_for(:message, subject: nil)
        end

        it 'renders new action' do
          post_invalid_message
          expect(response).to render_template 'new'
        end
      end
    end

    context 'draft' do
      def post_draft
        post :create, message: attributes_for(:message, subject: nil), commit: 'Save as draft'
      end

      it 'creates new message' do
        expect { post_draft }.to change { Message.count }.by(1)
      end

      it 'redirects to the new message form' do
        post_draft
        expect(response).to redirect_to new_message_url
      end
    end
  end
end
