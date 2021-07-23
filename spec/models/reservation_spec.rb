require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:flight) }
  end

  describe 'factory' do
    context 'when is a valid' do
      let(:reservation) { build(:reservation) }

      it { expect(reservation).to be_valid }
    end
  end
end
