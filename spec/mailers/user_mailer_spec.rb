# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'new_user_email' do
    let(:mail) { described_class.new_user_email }

    it 'has the correct subject' do
      expect(mail.subject).to eq('New user email')
    end

    it 'is addressed to the correct recipient' do
      expect(mail.to).to eq(['to@example.org'])
    end

    it 'is sent from the correct sender' do
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'contains the greeting message' do
      expect(mail.body.encoded).to match('Hi')
    end
  end
end
