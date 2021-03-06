require 'rails_helper'


RSpec.describe AuthorizeApiRequest do
    # Create test user
    let(:user) { create(:user) }
    # Mock `Authorization` header
    let(:header) { { 'Authorization' => token_generator(user.id) } }
    # Invalid request subject
    subject(:invalid_request_obj) { described_class.new({}) }
    # Valid request subject
    subject(:request_obj) { described_class.new(header) }

    # Test suite for AuthorizeApiRequest#call
    # This is our entry point into the services class
    describe '#call' do
        # returns user object when request is valid
        contextz 'when valid request' do
            it 'returns user object' do
                result = request_obj.call
                expect(result[:user]).to eq(user)
            end
        end

        # returns error message when invalid requests
        context 'when invalid request' do
            context 'when missing token' do
                it 'raises a MissingToken error' do
                    expect { invalid_request_obj.call }
                        .to raise_error(ExceptionHandler::MissingToken, 'Missing token')
                end
            end

            context 'when invalid token' do
                subject(:invalid_request_obj) do
                    # custom helper method `token_generator`
                    described_class.new('Authorization' => token_generator(s))
                end

                it 'raises an InvalidToken error' do
                    expect { invalid_request_obj.call }
                        .to raise_error(ExceptionHandler::InvalidToken, /Invalid token/)
                end
            end

            context 'when token is expired' do
                let(:header) { { 'Authorization' => expired_token_generator(user.id) } }
                subject(:invalid_request_obj) { described_class.new(header) }
                
                it 'handles JWT::DecodeError' do
                    expect { invalid_request_obj.call }
                        .to raise_error(
                            ExceptionHandler::InvalidToken,
                            /Not enough or too many segments/
                        )
                end
            end
        end
    end
end

            