require_relative 'spec_helper'


describe 'GET users/new' do
  it 'works' do
    get '/users/new' do
      expect last_response.include?('200')
    end
  end

end
