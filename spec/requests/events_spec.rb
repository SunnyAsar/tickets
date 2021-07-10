require 'rails_helper'

RSpec.describe "/events", type: :request do

  let(:user) { create :user,email: 'j@gmail.com' }

  describe "GET /index" do
    before(:each) { sign_in user }
    it "renders a successful response" do
      event = create :event
      get events_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    before(:each) { sign_in user }
    it "renders a successful response" do
      event = create :event
      get event_url(event)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    before(:each) { sign_in user }
    it "renders a successful response" do
      get new_event_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    before(:each) { sign_in user }
    it "render a successful response" do
      event = create(:event)
      get edit_event_url(event)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      before(:each) { sign_in user }
      it "creates a new Event" do
        expect {
          post events_url, params: { event: attributes_for(:event, status: :unpublished) }
        }.to change(Event, :count).by(1)
      end

      it "redirects to the created event" do
        post events_url, params: { event: attributes_for(:event, status: :unpublished) }
        expect(response).to redirect_to(event_url(Event.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Event" do
        expect {
          post events_url, params: { event: attributes_for(:event, name: nil) }
        }.to change(Event, :count).by(0)
      end

    end
  end

  describe "PATCH /update" do
    before(:each) { sign_in user }
    context "with valid parameters" do
      it "updates the requested event" do
        event = create(:event)
        patch event_url(event), params: { event: {name: 'hunting event'} }
        event.reload
        expect(event.name).to eq('hunting event')
      end

      it "redirects to the event" do
        event = create(:event)
        patch event_url(event), params: { event: {name: 'hunting event'} }
        event.reload
        expect(response).to redirect_to(event_url(event))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        event = create(:event)
        patch event_url(event), params: { event: { name: '' } }
        event.reload
        expect(event.name).to eq(event.name)
      end
    end
  end

  describe "DELETE /destroy" do
    before { sign_in user}
    it "destroys the requested event" do
      event = create(:event)
      expect {
        delete event_url(event)
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list" do
      event = create(:event)
      delete event_url(event)
      expect(response).to redirect_to(events_url)
    end
  end
end

