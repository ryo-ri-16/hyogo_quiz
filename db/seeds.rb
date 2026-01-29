Choice.destroy_all
Question.destroy_all
Category.destroy_all

ApplicationRecord.transaction do
  categories = [
    { slug: "kobe", name: '神戸' },
    { slug: "hanshin", name: '阪神' },
    { slug: "harima", name: '播磨' },
    { slug: "tajima", name: '但馬' },
    { slug: "tanba", name: '丹波' },
    { slug: "awaji", name: '淡路' }
  ]
  questions_data = [
    {
      title: '東灘区',
      content: '酒造りが有名な街です',
      category: categories[0],
      image_file: '001_東灘.jpeg',
      choices: [
        { content: '灘区', is_correct: false },
        { content: '東灘区', is_correct: true },
        { content: '御影区', is_correct: false },
        { content: '六甲区', is_correct: false }
      ]
    },
    {
      title: '灘区',
      content: '六甲山や摩耶山などがあります',
      category: categories[0],
      image_file: '002_灘.jpeg',
      choices: [
        { content: '西灘区', is_correct: false },
        { content: '摩耶区', is_correct: false },
        { content: '六甲区', is_correct: false },
        { content: '灘区', is_correct: true }
      ]
    },
    {
      title: '中央区',
      content: '旧居留地や中華街などがあります',
      category: categories[0],
      image_file: '003_中央.jpeg',
      choices: [
        { content: '三宮区', is_correct: false },
        { content: '兵庫区', is_correct: false },
        { content: '中央区', is_correct: true },
        { content: '生田区', is_correct: false }
      ]
    },
    {
      title: '兵庫区',
      content: 'かつて平清盛が福原京を建てた場所です',
      category: categories[0],
      image_file: '004_兵庫.jpeg',
      choices: [
        { content: '兵庫区', is_correct: true },
        { content: '中央区', is_correct: false },
        { content: '長田区', is_correct: false },
        { content: '福原区', is_correct: false }
      ]
    },
    {
      title: '長田区',
      content: '靴作りの街として知られていました',
      category: categories[0],
      image_file: '005_長田.jpeg',
      choices: [
        { content: '須磨区', is_correct: false },
        { content: '兵庫区', is_correct: false },
        { content: '長田区', is_correct: true },
        { content: '垂水区', is_correct: false }
      ]
    },
    {
      title: '須磨区',
      content: '海水浴場や水族館があります',
      category: categories[0],
      image_file: '006_須磨.jpeg',
      choices: [
        { content: '須磨区', is_correct: true },
        { content: '垂水区', is_correct: false },
        { content: '浜区', is_correct: false },
        { content: '長田区', is_correct: false }
      ]
    },
    {
      title: '垂水区',
      content: '明石海峡大橋があります',
      category: categories[0],
      image_file: '007_垂水.jpeg',
      choices: [
        { content: '須磨区', is_correct: false },
        { content: '西区', is_correct: false },
        { content: '明石区', is_correct: false },
        { content: '垂水区', is_correct: true }
      ]
    },
    {
      title: '北区',
      content: '有馬温泉があります',
      category: categories[0],
      image_file: '008_北.jpeg',
      choices: [
        { content: '西区', is_correct: false },
        { content: '北区', is_correct: true },
        { content: '有馬区', is_correct: false },
        { content: '谷上区', is_correct: false }
      ]
    },
    {
      title: '西区',
      content: '神戸市で最も人口が多い',
      category: categories[0],
      image_file: '009_西.jpeg',
      choices: [
        { content: '北区', is_correct: false },
        { content: '西神区', is_correct: false },
        { content: '西区', is_correct: true },
        { content: '緑区', is_correct: false }
      ]
    },
    {
      title: '尼崎市',
      content: '工業が盛ん',
      category: categories[1],
      image_file: '010_尼崎.png',
      choices: [
        { content: '尼崎', is_correct: true },
        { content: '西宮', is_correct: false },
        { content: '宝塚', is_correct: false },
        { content: '伊丹', is_correct: false }
      ]
    },
    {
      title: '伊丹市',
      content: '大阪国際空港がある',
      category: categories[1],
      image_file: '011_伊丹.png',
      choices: [
        { content: '川西', is_correct: false },
        { content: '尼崎', is_correct: false },
        { content: '伊丹', is_correct: true },
        { content: '宝塚', is_correct: false }
      ]
    },
    {
      title: '川西市',
      content: '三ツ矢サイダー発祥の地',
      category: categories[1],
      image_file: '012_川西.png',
      choices: [
        { content: '池田', is_correct: false },
        { content: '豊中', is_correct: false },
        { content: '伊丹', is_correct: false },
        { content: '川西', is_correct: true }
      ]
    },
    {
      title: '猪名川町',
      content: '豊臣秀吉の埋蔵金があるという都市伝説がある',
      category: categories[1],
      image_file: '013_猪名川.jpeg',
      choices: [
        { content: '武庫川', is_correct: false },
        { content: '猪名川', is_correct: true },
        { content: '神崎川', is_correct: false },
        { content: '生田川', is_correct: false }
      ]
    },
    {
      title: '西宮市',
      content: '阪神甲子園球場がある',
      category: categories[1],
      image_file: '014_西宮.jpeg',
      choices: [
        { content: '西宮', is_correct: true },
        { content: '阪神', is_correct: false },
        { content: '尼崎', is_correct: false },
        { content: '宝塚', is_correct: false }
      ]
    },
    {
      title: '芦屋市',
      content: '高級住宅街で知られる',
      category: categories[1],
      image_file: '015_芦屋.jpeg',
      choices: [
        { content: '住吉', is_correct: false },
        { content: '御影', is_correct: false },
        { content: '西宮', is_correct: false },
        { content: '芦屋', is_correct: true }
      ]
    },
    {
      title: '宝塚市',
      content: '歌劇団が有名',
      category: categories[1],
      image_file: '016_宝塚.jpeg',
      choices: [
        { content: '西宮', is_correct: false },
        { content: '宝塚', is_correct: true },
        { content: '伊丹', is_correct: false },
        { content: '三田', is_correct: false }
      ]
    },
    {
      title: '三田市',
      content: 'ウッディタウンやフラワータウンという町がある',
      category: categories[1],
      image_file: '017_三田.jpeg',
      choices: [
        { content: '三木', is_correct: false },
        { content: '小野', is_correct: false },
        { content: '三田', is_correct: true },
        { content: '加東', is_correct: false }
      ]
    },
    {
      title: '丹波篠山市',
      content: '黒豆が有名',
      category: categories[4],
      image_file: '018_丹波篠山.jpeg',
      choices: [
        { content: '丹波篠山', is_correct: true },
        { content: '丹波八木', is_correct: false },
        { content: '丹波', is_correct: false },
        { content: '丹波黒井', is_correct: false }
      ]
    },
    {
      title: '丹波市',
      content: '丹波大納言小豆というブランドがある',
      category: categories[4],
      image_file: '019_丹波.jpeg',
      choices: [
        { content: '丹波', is_correct: true },
        { content: '丹波氷上', is_correct: false },
        { content: '丹波篠山', is_correct: false },
        { content: '丹波柏原', is_correct: false }
      ]
    },
    {
      title: '朝来市',
      content: '「天空の城」の異名を持つ竹田城がある',
      category: categories[3],
      image_file: '020_朝来.jpeg',
      choices: [
        { content: '和田山', is_correct: false },
        { content: '生野', is_correct: false },
        { content: '朝来', is_correct: true },
        { content: '竹田', is_correct: false }
      ]
    },
    {
      title: '養父市',
      content: '兵庫県最高峰の氷ノ山があり、スキー樹がある',
      category: categories[3],
      image_file: '021_養父.jpeg',
      choices: [
        { content: '氷上', is_correct: false },
        { content: '養父', is_correct: true },
        { content: '朝来', is_correct: false },
        { content: '香美', is_correct: false }
      ]
    },
    {
      title: '豊岡市',
      content: '城崎温泉が有名',
      category: categories[3],
      image_file: '022_豊岡.jpeg',
      choices: [
        { content: '竹野', is_correct: false },
        { content: '出石', is_correct: false },
        { content: '城崎', is_correct: false },
        { content: '豊岡', is_correct: true }
      ]
    },
    {
      title: '香美町',
      content: '松葉ガニの水揚げ量日本一',
      category: categories[3],
      image_file: '023_香美.jpeg',
      choices: [
        { content: '香美', is_correct: true },
        { content: '豊岡', is_correct: false },
        { content: '新温泉', is_correct: false },
        { content: '養父', is_correct: false }
      ]
    },
    {
      title: '新温泉町',
      content: '景勝地が多く、湯村温泉がある',
      category: categories[3],
      image_file: '024_新温泉.jpeg',
      choices: [
        { content: '香美', is_correct: false },
        { content: '新温泉', is_correct: true },
        { content: '城崎', is_correct: false },
        { content: '出石', is_correct: false }
      ]
    },
    {
      title: '淡路市',
      content: '日本神話によると日本発祥の地',
      category: categories[5],
      image_file: '025_淡路.jpeg',
      choices: [
        { content: '北淡路', is_correct: false },
        { content: 'あわじ', is_correct: false },
        { content: '北淡', is_correct: false },
        { content: '淡路', is_correct: true }
      ]
    },
    {
      title: '洲本市',
      content: 'ホテルニューアワジのCMは関西で有名',
      category: categories[5],
      image_file: '026_洲本.jpeg',
      choices: [
        { content: '志筑', is_correct: false },
        { content: '中淡路', is_correct: false },
        { content: '洲本', is_correct: true },
        { content: '淡路', is_correct: false }
      ]
    },
    {
      title: '南あわじ市',
      content: '鳴門海峡を挟んで徳島県を隣接している',
      category: categories[5],
      image_file: '027_南あわじ.jpeg',
      choices: [
        { content: '南あわじ', is_correct: true },
        { content: 'あわじ', is_correct: false },
        { content: '洲本', is_correct: false },
        { content: '淡路', is_correct: false }
      ]
    },
    {
      title: '明石市',
      content: '日本の標準子午線である東経135度線があり、タコが有名',
      category: categories[2],
      image_file: '028_明石.jpeg',
      choices: [
        { content: '加古川', is_correct: false },
        { content: '高砂', is_correct: false },
        { content: '明石', is_correct: true },
        { content: '垂水', is_correct: false }
      ]
    },
    {
      title: '加古川市',
      content: 'かつめしというソウルフードがある',
      category: categories[2],
      image_file: '029_加古川.jpeg',
      choices: [
        { content: '高砂', is_correct: false },
        { content: '加古川', is_correct: true },
        { content: '加東', is_correct: false },
        { content: '市川', is_correct: false }
      ]
    },
    {
      title: '播磨町',
      content: '弥生時代の遺跡がある',
      category: categories[2],
      image_file: '030_播磨.jpeg',
      choices: [
        { content: '播磨', is_correct: true },
        { content: 'はりま', is_correct: false },
        { content: '播州', is_correct: false },
        { content: '播磨大中', is_correct: false }
      ]
    },
    {
      title: '稲美町',
      content: '池が多い',
      category: categories[2],
      image_file: '031_稲美.jpeg',
      choices: [
        { content: '岩岡', is_correct: false },
        { content: '平野', is_correct: false },
        { content: '玉津', is_correct: false },
        { content: '稲美', is_correct: true }
      ]
    },
    {
      title: '高砂市',
      content: '工業が盛ん',
      category: categories[2],
      image_file: '032_高砂.jpeg',
      choices: [
        { content: '高砂', is_correct: true },
        { content: '加西', is_correct: false },
        { content: '加古川', is_correct: false },
        { content: '播磨', is_correct: false }
      ]
    },
    {
      title: '三木市',
      content: '金物作りで発展してきた',
      category: categories[2],
      image_file: '033_三木.jpeg',
      choices: [
        { content: '小野', is_correct: false },
        { content: '三木', is_correct: true },
        { content: '粟生', is_correct: false },
        { content: '西脇', is_correct: false }
      ]
    },
    {
      title: '小野市',
      content: 'そろばんの生産地',
      category: categories[2],
      image_file: '034_小野.jpeg',
      choices: [
        { content: '小野', is_correct: true },
        { content: '西脇', is_correct: false },
        { content: '加東', is_correct: false },
        { content: '三木', is_correct: false }
      ]
    },
    {
      title: '加東市',
      content: '東条湖おもちゃ王国というテーマパークがある',
      category: categories[2],
      image_file: '035_加東.jpeg',
      choices: [
        { content: '加北', is_correct: false },
        { content: '加東', is_correct: true },
        { content: '加西', is_correct: false },
        { content: '加古川', is_correct: false }
      ]
    },
    {
      title: '加西市',
      content: 'フラワーパークという植物園やゴルフ場がある',
      category: categories[2],
      image_file: '036_加西.jpeg',
      choices: [
        { content: '加東', is_correct: false },
        { content: '北条', is_correct: false },
        { content: '加西', is_correct: true },
        { content: '富田', is_correct: false }
      ]
    },
    {
      title: '西脇市',
      content: '日本列島のおおよそ中心にある「日本のへそ」',
      category: categories[2],
      image_file: '037_西脇.jpeg',
      choices: [
        { content: '加北', is_correct: false },
        { content: '朝来', is_correct: false },
        { content: '東脇', is_correct: false },
        { content: '西脇', is_correct: true }
      ]
    },
    {
      title: '姫路市',
      content: '「白鷺の城」の異名を持つ世界遺産に登録されている城がある',
      category: categories[2],
      image_file: '038_姫路.jpeg',
      choices: [
        { content: '網干', is_correct: false },
        { content: '飾磨', is_correct: false },
        { content: '姫路', is_correct: true },
        { content: '明石', is_correct: false }
      ]
    },
    {
      title: '太子町',
      content: '宮本武蔵の出生地の候補と言われている(諸説あり)',
      category: categories[2],
      image_file: '039_太子.jpeg',
      choices: [
        { content: '市川', is_correct: false },
        { content: '太子', is_correct: true },
        { content: '福崎', is_correct: false },
        { content: '神河', is_correct: false }
      ]
    },
    {
      title: '福崎町',
      content: '「遠野物語」で知られる学者にして政治家、柳田國男の出生地',
      category: categories[2],
      image_file: '040_福崎.jpeg',
      choices: [
        { content: '福崎', is_correct: true },
        { content: '市川', is_correct: false },
        { content: '神河', is_correct: false },
        { content: '太子', is_correct: false }
      ]
    },
    {
      title: '市川町',
      content: '日本のゴルフクラブ発祥の地',
      category: categories[2],
      image_file: '041_市川.jpeg',
      choices: [
        { content: '太子', is_correct: false },
        { content: '市川', is_correct: true },
        { content: '福崎', is_correct: false },
        { content: '神河', is_correct: false }
      ]
    },
    {
      title: '神河町',
      content: '播磨奥座敷と言われる高原地帯',
      category: categories[2],
      image_file: '042_神河.jpeg',
      choices: [
        { content: '太子', is_correct: false },
        { content: '市川', is_correct: false },
        { content: '福崎', is_correct: false },
        { content: '神河', is_correct: true }
      ]
    },
    {
      title: 'たつの市',
      content: '醤油作りやソー麺の揖保乃糸が有名',
      category: categories[2],
      image_file: '043_たつの.jpeg',
      choices: [
        { content: '龍野', is_correct: false },
        { content: '揖保川', is_correct: false },
        { content: 'たつの', is_correct: true },
        { content: '揖保', is_correct: false }
      ]
    },
    {
      title: '相生市',
      content: '造船業で栄えた',
      category: categories[2],
      image_file: '044_相生.jpeg',
      choices: [
        { content: '赤穂', is_correct: false },
        { content: '相生', is_correct: true },
        { content: '上郡', is_correct: false },
        { content: '福河', is_correct: false }
      ]
    },
    {
      title: '多可町',
      content: '「敬老の日」発祥の地を謳っている(諸説あり)',
      category: categories[2],
      image_file: '045_多可.jpeg',
      choices: [
        { content: '多可', is_correct: true },
        { content: '福河', is_correct: false },
        { content: '太子', is_correct: false },
        { content: '神河', is_correct: false }
      ]
    },
    {
      title: '赤穂市',
      content: '時代劇「忠臣蔵」と塩で有名',
      category: categories[2],
      image_file: '046_赤穂.jpeg',
      choices: [
        { content: '吉良', is_correct: false },
        { content: '大石', is_correct: false },
        { content: '浅野', is_correct: false },
        { content: '赤穂', is_correct: true }
      ]
    },
    {
      title: '上郡町',
      content: '山陽、山陰に繋がる交通の要衝',
      category: categories[2],
      image_file: '047_上郡.jpeg',
      choices: [
        { content: '上月', is_correct: false },
        { content: '上郡', is_correct: true },
        { content: '宍粟', is_correct: false },
        { content: '佐用', is_correct: false }
      ]
    },
    {
      title: '佐用町',
      content: 'SPring-8という大型放射光施設がある',
      category: categories[2],
      image_file: '048_佐用.jpeg',
      choices: [
        { content: '佐用', is_correct: true },
        { content: '石井', is_correct: false },
        { content: '福河', is_correct: false },
        { content: '宍粟', is_correct: false }
      ]
    },
    {
      title: '宍粟市',
      content: '森林王国を自称している',
      category: categories[2],
      image_file: '049_宍粟.jpeg',
      choices: [
        { content: '多可', is_correct: false },
        { content: '上郡', is_correct: false },
        { content: '宍粟', is_correct: true },
        { content: '佐用', is_correct: false }
      ]
    }
  ]

  categories.each do |category_data|
    Category.find_or_create_by!(slug: category_data[:slug]) do |c|
      c.name = category_data[:name]
    end
  end

  questions_data.each do |q|
    category = Category.find_by!(slug: q[:category][:slug])

    question = Question.create!(
      title: q[:title],
      content: q[:content],
      category: category
    )

    q[:choices].each_with_index do |c, index|
      question.choices.create!(
        content: c[:content],
        is_correct: c[:is_correct],
        position: index + 1
      )
    end


    if q[:image_file].present?
      question.image = File.open(
        Rails.root.join("db/seed_images", q[:image_file])
      )
      question.save!
    end
  end
end
