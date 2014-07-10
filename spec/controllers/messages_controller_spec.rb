require 'rails_helper'

describe MessagesController do
  describe 'GET new' do
    it 'renders new message form' do
      get :new
      expect(response).to render_template 'new'
    end
  end
end
