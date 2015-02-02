require 'helper'

module Idolmaster
  describe CinderellaGirls do
    it 'has IDOLS' do
      assert CinderellaGirls::IDOLS.is_a?(Array)
    end

    it 'respond to each' do
      assert CinderellaGirls.respond_to?(:each)
    end

    it 'delegate to IDOLS.each' do
      all = []
      CinderellaGirls.each{|idol| all << idol }
      assert_equal CinderellaGirls::IDOLS, all
    end

    it 'respond to to_a' do
      assert CinderellaGirls.respond_to?(:each)
      assert_equal CinderellaGirls::IDOLS, CinderellaGirls.to_a
    end

    it 'respond to size' do
      assert CinderellaGirls.respond_to?(:size)
      assert_equal CinderellaGirls::IDOLS.size, CinderellaGirls.size
    end

    it 'is an Enumerable' do
      assert CinderellaGirls.is_a?(Enumerable)
    end

    it 'tell json_path' do
      assert CinderellaGirls.json_path.exist?
    end

    describe '.search' do
      it 'search idol name' do
        assert_equal '南条光', CinderellaGirls.search(name: '南条光')[0][:name]
      end

      it 'search full name' do
        assert_equal '高森藍子', CinderellaGirls.search(name: /ふんわりｶﾞｰﾙ/)[0][:name]
      end

      it 'accept string' do
        assert_equal '大沼くるみ', CinderellaGirls.search(bust: 'おっきい')[0][:name]
      end

      it 'accept number' do
        assert_equal '高森藍子', CinderellaGirls.search(bust: 74, waist: 60)[0][:name]
      end

      it 'accept regexp' do
        assert_equal '安部菜々', CinderellaGirls.search(age: /永遠の/)[0][:name]
      end

      it 'accept range of number' do
        assert_equal '諸星きらり', CinderellaGirls.search(height: 182..Float::INFINITY)[0][:name]
      end
    end
  end
end
