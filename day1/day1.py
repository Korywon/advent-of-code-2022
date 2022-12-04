with open('input.txt') as file:
  max_cal = 0
  sum_cal = 0

  for line in file:
    if line[0] == '\n':
      max_cal = max(max_cal, sum_cal)
      sum_cal = 0
    else:
      sum_cal = sum_cal + int(line)
  max_cal = max(max_cal, sum_cal)

  print(max_cal)
