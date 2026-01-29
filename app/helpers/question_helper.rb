module QuestionHelper
  def twitter_share_url
    tweet_text = "【兵庫県市区町村クイズ結果】\n\n" \
                  "#{@total_count}問中 #{@correct_count}問正解!(#{@score_percent}%)\n" \
                  "あなたも挑戦してみよう！\n"

    share_url = result_questions_url

    "https://twitter.com/intent/tweet" \
    "?url=#{CGI.escape(share_url)}" \
    "&text=#{CGI.escape(tweet_text)}" \
    "&hashtags=兵庫県市区町村クイズ"
  end
end
