#include <stdio.h>
#include <stdlib.h>

int strtoint(const char *line) {
  char *end;
  long num = strtol(line, &end, 10);
  return (int) num;
}

int main(void) {
  FILE *fp;
  char *line = NULL;
  size_t length = 0;
  ssize_t read;

  fp = fopen("input.txt", "r");

  while ((read = getline(&line, &length, fp)) != -1) {
    int calories = strtoint(line);
    printf("%d\n", calories);
  }

  fclose(fp);
  if (line) free(line);

  return 0;
}
