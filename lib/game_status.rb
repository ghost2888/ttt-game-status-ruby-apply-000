# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |w|
  win_index_1 = w[0]
  win_index_2 = w[1]
  win_index_3 = w[2]
  
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return w
    else
      false
    end
  end
  false
end

def full?(board)
 board.all? {|full| full == "X"||"O" && full != " "}
end

def draw?(board)
  if won?(board) || full?(board) == false 
    false
  else
    true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board) == true
    true
  end
end

def winner(board)
  winning_array = [ ]
  winning_array = won?(board)
  if [winning_array[0]] == "X"
    "X"
  elsif [winning_array[0]] == "O"
    "O"
  else
    nil
  end
end