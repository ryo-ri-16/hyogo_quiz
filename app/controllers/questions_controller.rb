class QuestionsController < ApplicationController
  # 問題設定画面
  def index
    @categories = Category.includes(:questions)
  end

  # クイズ開始処理
  def start
    clear_quiz_session

    category_id = params[:category_id].presence
    question_count = params[:question_count].to_i

    # バリデーション
    if question_count <= 0
      redirect_to questions_path, alert: "問題数を選択してください" and return
    end

    # 問題を取得
    questions = if category_id
      Question.includes(:category, :choices).where(category_id: category_id)
    else
      Question.includes(:category, :choices).all
    end

    available_count = questions.count

    if available_count == 0
      redirect_to questions_path, alert: "問題が見つかりません" and return
    end

    # 実際に出題する問題数を決定
    actual_question_count = [ question_count, available_count ].min

    # 問題をシャッフルして ID を保存
    all_question_ids = questions.distinct.pluck(:id)
    shuffled_ids = all_question_ids.shuffle
    selected_ids = shuffled_ids.take(actual_question_count)

    session[:question_ids] = selected_ids
    session[:current_question_index] = 0
    session[:answers] = []

    redirect_to play_questions_path
  end

  # クイズ画面
  def play
    # セッションデータの存在確認
    unless session[:question_ids].present? && session[:current_question_index].present?
      redirect_to questions_path, alert: "クイズを開始してください" and return
    end

    index = session[:current_question_index]
    question_ids = session[:question_ids]

    # インデックスが範囲外の場合は結果画面へ
    if index >= question_ids.size
      redirect_to result_questions_path and return
    end

    question_id = question_ids[index]

    # 念のため nil チェック
    if question_id.nil?
      redirect_to result_questions_path and return
    end

    @question = Question.includes(:category, :choices).find(question_id)
    @choices = @question.choices.ordered.to_a.shuffle
  end

  # 結果処理
  def answer
    if params[:choice_id].blank?
      flash[:alert] = "選択肢を選んでください"
      redirect_to play_questions_path and return
    end

    choice = Choice.find(params[:choice_id])

    index = session[:current_question_index]

    # 回答を保存（重要）
    session[:answers] << {
      question_id: session[:question_ids][index],
      choice_id: params[:choice_id],
      is_correct: choice.is_correct
    }

    session[:current_question_index] += 1

    redirect_to play_questions_path
  end

  # 結果発表
  def result
    @answers = session[:answers] || []

    @correct_count = @answers.count { |a| a["is_correct"] }
    @total_count   = @answers.size
    @score_percent = (@correct_count.to_f / @total_count * 100).round

    question_ids = @answers.map { |a| a["question_id"] }

    questions = Question
      .includes(:choices)
      .where(id: question_ids)
      .index_by(&:id)

    @results = @answers.map do |a|
      question = questions[a["question_id"]]
      next if question.nil?

      selected_choice = question.choices.find { |c| c.id == a["choice_id"].to_i }

      {
        question: question,
        selected_choice: selected_choice,
        is_correct: a["is_correct"]
      }
    end.compact
  end

  private

  def clear_quiz_session
    session.delete(:category_id)
    session.delete(:question_count)
    session.delete(:current_question_index)
    session.delete(:answers)
  end
end
