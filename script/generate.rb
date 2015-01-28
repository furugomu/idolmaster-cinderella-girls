# json から rb を作る

Bundler.require(:development)

def main
  dir = File.join(File.dirname(__FILE__), '../lib/idolmaster/cinderella_girls')
  idols = open(File.join(dir, 'idols.json')){|f| JSON.load(f.read()) }
  idols = idols.map{|idol| process(idol) }
  open(File.join(dir, 'idols.rb'), 'wb') do |f|
    f.puts <<-T_T
module Idolmaster
  module CinderellaGirls
    IDOLS = #{idols.inspect}
  end
end
    T_T
  end
end

def process(idol)
  idol = symbolyze_keys(idol)
  idol[:profiles] = idol[:profiles].map{|p| process_profile(p) }
  idol
end

def process_profile(profile)
  profile = symbolyze_keys(profile)
  profile[:bust], profile[:weist], profile[:hip] = profile[:size].split('/')
  profile
end

def symbolyze_keys(hash)
  hash.each_with_object({}){|(k, v), h| h[k.to_sym] = v }
end

main()
