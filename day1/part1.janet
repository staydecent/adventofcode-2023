#!/usr/bin/env janet

(defn readlines
  ``read each line of given filename into list``
  [filename]
  (with [fh (file/open filename)]  # Similar to Python, open file
    (var lines @[])  # create empty array
    # :iterate is a verb provided by the loop macro
    # https://janet-lang.org/api/index.html#loop
    # :line is provided by file/readA
    # https://janetdocs.com/file/read
    (loop [line :iterate (file/read fh :line)]
      # each line ends with newline char. Let's ignore if that's
      # all there is.
      (if (> (length line) 1)
        (array/push lines line))
        nil)
    lines))

(defn first-last-digits
  ``On each line, the calibration value can be found by
  combining the first digit and the last digit (in that order)
  to form a single two-digit number.
  
  https://adventofcode.com/2023/day/1``
  [str]
  (def indices (peg/find-all '(range "09") str))
  (def first-index (indices 0))
  (def last-index (array/peek indices))
  (int/u64 
    (string (string/slice str first-index (+ 1 first-index))
            (string/slice str last-index (+ 1 last-index)))))

(defn main
  ``& denotes a variadic function, collecting all given args
  into the variable 'args'.``
  [& args]
  # this script filename will always be the 1st argument.
  # We need to check if there was an additional argument given.
  (def filename (if (> (length args) 1)
                  (args 1)
                  "input.txt"))
  (def lines (readlines filename))
  (def digits (map first-last-digits lines))
  (pp (sum digits)))
