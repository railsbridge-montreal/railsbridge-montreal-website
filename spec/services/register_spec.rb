require 'rails_helper'

RSpec.describe Register do
  describe '#register' do
    let(:processed_params) { double(:processed_params) }
    let(:fake_params_processor) { double(:params_processor, call: processed_params) }

    subject { Register.new(params_processors: [fake_params_processor]) }

    describe "#register" do

      let(:registrant) { double(:registrant, save: nil) }
      let(:notification) { double(:notification, deliver: nil) }

      before do
        allow(Registrant).to receive_messages(new: registrant)
        allow(Notifier).to receive_messages(new_registration: notification)
      end

      it 'should create a new registrant' do
        raw_params = double(:raw_params)
        subject.register(raw_params)

        expect(Registrant).to have_received(:new).with(processed_params)
      end

      context 'given the registrant is successfully created' do
        before { allow(registrant).to receive(:save).and_return(true) }

        it 'should send a notification' do
          raw_params = double(:raw_params)
          subject.register(raw_params)

          expect(Notifier).to have_received(:new_registration).with(registrant)
          expect(notification).to have_received(:deliver)
        end
      end

      context 'given the registrant is not created' do
        before { allow(registrant).to receive(:save).and_return(false) }

        it 'should not send a notification' do
          raw_params = double(:raw_params)
          subject.register(raw_params)

          expect(Notifier).not_to have_received(:new_registration).with(registrant)
        end
      end
    end
  end
end
