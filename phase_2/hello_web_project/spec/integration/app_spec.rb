require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do 

  # so we can use rack-test helper methods
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do

    it 'returns Julia, Mary, Karim' do
      response = get('/names?names=Julia, Mary, Karim')

      expect(response.status).to eq(200)
      expect(response.body).to eq "Julia, Mary, Karim"
    end

    it 'returns 404 Not Found' do
      response = get('/name')

      expect(response.status).to eq(404)
      # expect(response.body).to eq(expected_response)
    end
  end

  context "POST /" do 
    it 'returns sorted string: Alice,Joe,Julia,Kieran,Zoe' do 
      response = post('/sort-names?names=Joe,Alice,Zoe,Julia,Kieran')

      expect(response.status).to eq(200)
      expect(response.body).to eq "Alice,Joe,Julia,Kieran,Zoe"
    end 

    it 'returns sorted string: Abi,Greg,Larry,Maisie,Ollie' do 
      response = post('/sort-names?names=Greg,Abi,Ollie,Maisie,Larry')

      expect(response.status).to eq(200)
      expect(response.body).to eq "Abi,Greg,Larry,Maisie,Ollie"
    end 
  end
  context "Get /hello" do 
    it "tests the /hello path" do 
      response = get('/hello')
      expect(response.body).to include '<h1>Hello!</h1>'
    end
  end
end
