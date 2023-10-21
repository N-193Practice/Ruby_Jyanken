# じゃんけんの手を表す定数
ROCK = 'グー'
PAPER = 'パー'
SCISSORS = 'チョキ'
NOFIGHT = '戦わない'

# じゃんけんの関数
def play_janken
  puts 'じゃんけんの手を選んでください (0: グー, 1: チョキ, 2: パー, 3: 戦わない):'
  player_choice = gets.chomp.to_i
  # 相手プレイヤーがランダムで手を選ぶ
  computer_choice = [ROCK, PAPER, SCISSORS, NOFIGHT].sample

  player_hand = [ROCK, SCISSORS, PAPER, NOFIGHT][player_choice]
  puts "あなたの手: #{player_hand}"
  puts "相手の手: #{computer_choice}"

  if player_hand == computer_choice
    puts '引き分けです.'
    return play_janken
  elsif player_hand == NOFIGHT || computer_choice == NOFIGHT
    puts '戦わないを選びました。戦いを回避します.'
    return play_janken
  else
    # プレイヤーがじゃんけんに勝った時
    if (player_hand == ROCK && computer_choice == SCISSORS) ||
       (player_hand == SCISSORS && computer_choice == PAPER) ||
       (player_hand == PAPER && computer_choice == ROCK)
      puts 'じゃんけんに勝利しました。あっち向いてホイの指を選択してください。'
      your_choice = play_atchi_muite_hoi
      if your_choice == computer_choice
        puts 'あなたの勝利です。(じゃんけん終了)'
      else
        puts 'あなたはあっち向いてホイに失敗しました。(じゃんけんの最初に戻ります)'
        return play_janken
      end
    else
      puts '相手がじゃんけんに勝利しました。あっち向いてホイの顔の向きを選択してください。'
      your_choice = play_atchi_muite_hoi
      if your_choice == computer_choice
        puts '相手の勝利です。(じゃんけん終了)'
      else
        puts '相手があっち向いてホイに失敗しました。(じゃんけんの最初に戻ります)'
        return play_janken
      end
    end
  end
end

# あっち向いてホイの関数
def play_atchi_muite_hoi
  puts 'あっち向いてホイ (0: 上, 1: 右, 2: 下, 3: 左):'
  your_choice = gets.chomp.to_i
  computer_choice = rand(4)
  puts "相手: #{computer_choice}"
  return your_choice
end

# ゲーム開始
play_janken

