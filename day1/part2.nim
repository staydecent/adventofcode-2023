import std/os
import strutils

var
  filename: string = "input.txt"

when declared(paramStr):
  if paramCount() > 0:
    filename = paramStr(1)

proc getDigits(s: string): int =
  var
    digits: seq[char]

  for ch in s:
    if ch.isDigit():
      digits.add(ch)

  if len(digits) > 0:
    result = parseInt(digits[0] & digits[^1])

proc result: int =
  for line in filename.lines:
    result += line.multiReplace(
      ("one", "1"), ("two", "2"), ("three", "3"),
      ("four", "4"), ("five", "5"), ("six", "6"),
      ("seven", "7"), ("eight", "8"), ("nine", "9"),
    ).getDigits()

echo result()
