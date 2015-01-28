require 'helper'

module Idolmaster
  describe CinderellaGirls do
    it 'has IDOLS' do
      assert CinderellaGirls::IDOLS.is_a?(Array)
    end
  end
end
