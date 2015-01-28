Bundler.require(:development)

class ImasCgAgent
  attr_reader :agent
  def initialize(session_id)
    session_id.to_s.strip == '' and raise ArgumentError 'session_id ない'
    @agent = Mechanize.new
    @agent.user_agent_alias = "iPhone"
    @agent.agent.cookie_jar.add HTTP::Cookie.new(
      'sp_mbga_sid_12008305',
      session_id,
      path: '/12008305',
      domain: 'sp.pf.mbga.jp',
    )
  end

  def get(url)
    url = mbga_url(url)
    page = @agent.get(url)
    if page.uri.to_s.include?('/_pf_smart_auth')
      raise 'ログインページに飛ばされた'
    end
    page
  end

  def mbga_url(url)
    return url if url.start_with?('http://')
    url = File.join('http://125.6.169.35/idolmaster/', url)
    'http://sp.pf.mbga.jp/12008305/?url=' + CGI.escape(url)
  end
end

class Scraper
  def initialize
    @agent = ImasCgAgent.new(ENV['SESSION_ID'])
  end

  def scrape
    idols = []
    list_url = 'gallery/index/0/1/?history=2'
    loop do
      list_url, data = index(list_url)
      data.each do |name, url|
        $stderr.puts name
        idols << {
          'name' => name,
          'profiles' => profiles(url),
        }
        sleep 1
      end
      list_url or break
    end

    idols
  end

  private

  def index(url)
    page = @agent.get(url)
    next_link = page.root.at('[accesskey="#"]')
    [
      next_link && next_link.attr('href'),
      page.root.css('.gallery a').map{|a|
        [a.text.strip(), a.attr('href')]
      },
    ]
  end

  def profiles(url)
    page = @agent.get(url)
    page.root.css('.idol').map do |profile|
      # style から画像名を得る
      style = profile.at('[style]').attr('style')
      image_id = style.match(/%2F([0-9a-f]+)\.jpg/)[1]
      # その他
      array = profile.css('[type=hidden]').map{|hidden|
        hidden.attribute_nodes.select{|attr|
          attr.name =~ /^data-/
        }.map{|attr|
          value = CGI.unescape(attr.value)
          if value[0] == '{' # 中身が JSON
            JSON.parse(value).to_a
          else
            [attr.name.sub(/data-/, ''), value]
          end
        }
      }.flatten
      Hash[*array].merge('image_id'=>image_id)
    end
  end

end

def main
  idols = Scraper.new.scrape()
  dir = File.join(File.dirname(__FILE__), '../lib/idolmaster')
  open(File.join(dir, 'cinderella_girls.yaml'), 'w'){|f|f.write(YAML.dump(idols))}
  open(File.join(dir, 'cinderella_girls.json'), 'w'){|f|f.write(JSON.dump(idols))}
end

main()
