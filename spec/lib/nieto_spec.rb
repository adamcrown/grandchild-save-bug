require 'spec_helper'

describe Nieto do
  let!(:padre) { Padre.create name: 'George Sr.' }
  let!(:nina) { padre.ninos.create name: 'Lindsay' }
  let!(:nino) { padre.ninos.create name: 'Michael' }
  let!(:nieto) { nino.nietos.create name: 'George Michael' }

  # This one fails but shouldn't.
  context 'when saving' do
    it 'should not create a new record' do
      expect { nieto.update name: 'Mr. Manager' }.to_not change { nino.reload.nietos.length }
    end
  end

  # This is the workaround. It will pass.
  context 'when saving via the parent' do
    it 'should not create a new record' do
      expect { nieto.name = 'Mr. Manager'; nieto.nino.save! }.to_not change { nino.reload.nietos.length }
    end
  end
end
