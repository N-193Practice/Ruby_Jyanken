# じゃんけんの手を表す定数
ROCK = 'グー'
PAPER = 'パー'
SCISSORS = 'チョキ'
NOFIGHT = '戦わない' 

# プレーヤーが出す手を入力
puts 'じゃんけんの手を選んでください (0: グー, 1: チョキ, 2: パー, 3: 戦わない):'
player_choice = gets.chomp.to_i

# 相手プレーヤーがランダムで手を選ぶ
computer_choice = [ROCK, PAPER, SCISSORS, NOFIGHT].sample

# じゃんけんの勝敗を判定
if player_choice == 0
  player_hand = ROCK
elsif player_choice == 1
  player_hand = SCISSORS
elsif player_choice == 2
  player_hand = PAPER
elsif player_choice == 3
  player_hand = NOFIGHT
else
  puts '無効な選択です。'
  exit
end

puts "あなたの手: #{player_hand}"
puts "相手の手: #{computer_choice}"

if player_hand == computer_choice
  puts '引き分けです.'
elsif (player_hand == ROCK && computer_choice == SCISSORS) ||
      (player_hand == SCISSORS && computer_choice == PAPER) ||
      (player_hand == PAPER && computer_choice == ROCK)
  puts 'あなたの勝ちです.'
  puts 'あっち向いてホイ (0: 上, 1: 右, 2: 下, 3: 左):'
  your_choice = gets.chomp.to_i
  computer_choice = rand(4)
  puts "相手: #{computer_choice}"
  if your_choice == computer_choice
    puts 'あなたの勝利!'
  else
    puts '相手の勝利!'
  end
else
  puts 'あなたの負けです.'
  puts 'あっち向いてホイ (0: 上, 1: 右, 2: 下, 3: 左):'
  your_choice = gets.chomp.to_i
  computer_choice = rand(4)
  puts "相手: #{computer_choice}"
  if your_choice == computer_choice
    puts '相手の勝利!'
  else
    puts 'あなたの勝利!'
  end
end