require "idolmaster/cinderella_girls/version"
require "idolmaster/cinderella_girls/idols"
require 'pathname'

module Idolmaster
  module CinderellaGirls
    extend Enumerable

    class << self
      def each(&block)
        IDOLS.each(&block)
      end

      def to_a
        IDOLS.to_a
      end

      def size
        IDOLS.size
      end

      def json_path
        Pathname.new(__FILE__).dirname.join('cinderella_girls/idols.json')
      end

      def search(q={})
        find_all do |idol|
          next true if q[:name] && q[:name] === idol[:name]
          idol[:profiles].any? do |profile|
            q.all? do |key, condition|
              value = profile[key] or break
              type = condition.is_a?(Range) ? condition.first : condition
              case type
              when String, Regexp
                value = value.to_s
              when Integer
                value = value.to_i
              when Float
                value = value.to_i
              end
              condition === value
            end
          end
        end
      end
    end
  end
end
