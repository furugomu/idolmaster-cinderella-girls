# Idolmaster::CinderellaGirls

![THE IDOLM@STER Cinderella Girls](http://cinderella.idolmaster.jp/images/logo_cin.png)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'idolmaster-cinderella-girls'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install idolmaster-cinderella-girls

## Usage

```ruby
require 'idolmaster-cinderella-girls'
Idolmaster::CinderellaGirls.search age: 16, type: 'passion', height: 155
```
```ruby
=>
[{:name=>"高森藍子",
  :profiles=>
   [{:name=>"高森藍子",
     :rarity=>"normal",
     :attribute=>"passion",
     :kana=>"たかもりあいこ",
     :age=>"16歳",
     :height=>"155cm",
     :weight=>"42kg",
     :size=>"74/60/79",
     :birthday=>"7月25日",
     :constellation=>"獅子座",
     :blood=>"O型",
     :arm=>"右",
     :from=>"東京",
     :hobby=>"近所の公園をお散歩",
     :comment=>
      "初めまして､ﾌﾟﾛﾃﾞｭｰｻｰさん｡ﾌｧﾝのみなさんが優しい気持ちになれるような､微笑んでくれるようなｱｲﾄﾞﾙを目指したいと思って
いるんです｡よろしくお願いしますねっ｡",
     :vid=>"0",
     :cv=>"金子有希",
     :image_id=>"25ea7fdd66fc6bd8e7209a4c0d2ba00c",
     :bust=>"74",
     :weist=>"60",
     :hip=>"79"},
    ...]}]
```

`Enumerable` methods are available.

```ruby
Idolmaster::CinderellaGirls.count #=> 200
Idolmaster::CinderellaGirls.to_a #=> whole idols
```

## Contributing

1. Fork it ( https://github.com/furugomu/idolmaster-cinderella-girls/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
