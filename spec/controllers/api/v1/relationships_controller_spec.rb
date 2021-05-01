require 'rails_helper'

RSpec.describe Api::V1::RelationshipsController, '#followers' do
    context "When show followers is successful" do

        let(:user) { create(:user)}
        let(:follower) { create(:follower, user: user)}

        before do
            sign_in(user)
        end
        
        it "Should returns HTTP success code" do
            expect(response).to have_http_status(:success)
        end
    end
end

RSpec.describe Api::V1::RelationshipsController, '#following' do
    context "When show followers is successful" do

        let(:user) { create(:user)}
        let(:following) { create(:following, user: user)}

        before do
            sign_in(user)
        end
        
        it "Should returns HTTP success code" do
            expect(response).to have_http_status(:success)
        end
    end
end

RSpec.describe Api::V1::RelationshipsController, '#Seguir' do

    context "When to follow a new user is successful" do
        let(:user) { create(:user)}
        let(:relationship) { create(:relationship, user: user)}

        before do
            sign_in(user)
        end
        
        it "Should returns HTTP success code" do
            expect(response).to have_http_status(:success)
        end
    end
end

