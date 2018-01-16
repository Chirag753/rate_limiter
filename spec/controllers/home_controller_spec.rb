require 'rails_helper'

describe HomeController do
  before do
    Timecop.freeze(Time.now)
  end

  context 'not exceeding the rate limit' do
    describe '#index' do
      it 'should return the correct response' do
        expected_response = {
         "message" => 'ok'
        }

        get :index

        expect(JSON.parse(response.body)).to eq(expected_response)
      end

      it 'should return the correct response code' do
        get :index

        expect(response.code).to eq('200')
      end
    end
  end

  context 'exceeding the rate limit' do
    describe '#index' do
      let!(:request_limit) {
        (0..RequestLimit::MAX_LIMIT-1).each do |i|
        create(:request_limit, ip: '0.0.0.0')
        end
      }

      it 'should return the correct response' do

        time_left=(Time.now.end_of_hour).to_i-(Time.now).to_i

        expected_response = {
         "message" => "Rate limit exceeded. Try again in #{time_left} seconds"
        }

        get :index

        expect(JSON.parse(response.body)).to eq(expected_response)
      end

      it 'should return the correct response code' do
        get :index

        expect(response.code).to eq('429')
      end
    end
  end
end

#run the test as follows
# rspec ./spec/controllers/home_controller_spec.rb