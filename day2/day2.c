#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define DRAW_SCORE 3
#define WINNER_SCORE 6

enum shape {
  rock = 1,
  paper,
  scissors,
};

const char* shape_to_string(enum shape s) {
  switch(s) {
    case rock: return "rock";
    case paper: return "paper";
    case scissors: return "scissors";
    default: return "unknown";
  }
}

enum shape char_to_shape(char c) {
  switch(c) {
    case 'A': return rock;
    case 'B': return paper;
    case 'C': return scissors;
    case 'X': return rock;
    case 'Y': return paper;
    case 'Z': return scissors;
    default: return rock;
  }
}

bool is_winner(char opponent, char player) {
  enum shape opponent_shape = char_to_shape(opponent);
  enum shape player_shape = char_to_shape(player);

  switch(opponent_shape) {
    case rock: return player_shape == paper;
    case paper: return player_shape == scissors;
    case scissors: return player_shape == rock;
    default: return false;
  }
}

int main(void) {
  FILE *fp;
  char *line = NULL;
  size_t length = 0;
  ssize_t read;
  char opponent, player;
  int opponent_score = 0, player_score = 0;
  enum shape opponent_shape, player_shape;
  bool winner;

  fp = fopen("input.txt", "r");

  while ((read = getline(&line, &length, fp)) != -1) {
    opponent = line[0];
    player = line[2];
    winner = is_winner(opponent, player);
    opponent_shape = char_to_shape(opponent);
    player_shape = char_to_shape(player);

    opponent_score += opponent_shape;
    player_score += player_shape;


    if (opponent_shape == player_shape) {
      player_score += DRAW_SCORE;
      opponent_score += DRAW_SCORE;
    } else if (winner) {
      player_score += WINNER_SCORE;
    } else {
      opponent_score += WINNER_SCORE;
    }
  }

  fclose(fp);
  if (line) free(line);

  return 0;
}
