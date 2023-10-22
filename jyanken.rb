# じゃんけんの手を表す定数
ROCK = 'グー'
PAPER = 'パー'
SCISSORS = 'チョキ'
NOFIGHT = '戦わない'

# あっち向いてホイの方向を表す定数
UP = '上'
RIGHT = '右'
DOWN = '下'
LEFT = '左'

# じゃんけんの関数
def play_janken
  puts 'じゃんけんの手を選んでください (0: グー, 1: チョキ, 2: パー, 3: 戦わない):'
  player_choice = gets.chomp.to_i

  player_hand = [ROCK, SCISSORS, PAPER, NOFIGHT][player_choice]
  # 相手の出す手をランダムにする
  computer_hand = [ROCK, PAPER, SCISSORS].sample
  puts "あなたの手: #{player_hand}"
  puts "相手の手: #{computer_hand}"

  if player_hand == NOFIGHT
    puts '戦わない。が選択されたため、じゃんけん最初の画面に戻ります.'
    return play_janken
  elsif player_hand == computer_hand
    puts '引き分けです。じゃんけん最初の画面に戻ります.'
    return play_janken
  else
    # プレイヤーがじゃんけんに勝った時
    if (player_hand == ROCK && computer_hand == SCISSORS) ||
       (player_hand == SCISSORS && computer_hand == PAPER) ||
       (player_hand == PAPER && computer_hand == ROCK)
      puts 'じゃんけんに勝利しました。あっち向いてホイの指を選択してください.'
      your_choice = play_atchi_muite_hoi
      computer_choice = rand(4)  # コンピューターの選択をランダムに生成
      puts "相手: #{direction_to_string(computer_choice)}"  # 相手の選択を表示

      if your_choice == computer_choice
        puts 'あなたの勝利です。（じゃんけん終了です）'
      else
        puts "あなたはあっち向いてホイに失敗しました。相手は#{direction_to_string(computer_choice)}を選びました."
        return play_janken
      end
    else
      puts '相手がじゃんけんに勝利しました。あっち向いてホイの顔の向きを選択してください.'
      your_choice = play_atchi_muite_hoi
      computer_choice = rand(4)  # コンピューターの選択をランダムに生成
      puts "相手: #{direction_to_string(computer_choice)}"  # 相手の選択を表示

      if your_choice == computer_choice
        puts '相手の勝利です。（じゃんけん終了です）'
      else
        puts '相手があっち向いてホイに失敗しました.'
        return play_janken
      end
    end
  end
end

# あっち向いてホイの関数
def play_atchi_muite_hoi
  puts 'あっち向いてホイ (0: 上, 1: 右, 2: 下, 3: 左):'
  your_choice = gets.chomp.to_i
  case your_choice
  when 0
    puts "あなたが選んだ方向: #{UP}"
  when 1
    puts "あなたが選んだ方向: #{RIGHT}"
  when 2
    puts "あなたが選んだ方向: #{DOWN}"
  when 3
    puts "あなたが選んだ方向: #{LEFT}"
  else
    puts "無効な選択です。もう一度選んでください。"
    return play_atchi_muite_hoi
  end
  return your_choice
end

# 数字から文字に変換するヘルパー関数
def direction_to_string(direction)
  case direction
  when 0
    return UP
  when 1
    return RIGHT
  when 2
    return DOWN
  when 3
    return LEFT
  else
    puts "無効な選択です。もう一度選んでください。"
    return play_atchi_muite_hoi
  end
end

# ゲーム開始
play_janken
