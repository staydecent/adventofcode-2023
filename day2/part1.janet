#!/usr/bin/env janet

(def inventory {:r 12 :g 13 :b 14})

# for each game, check each draw

(defn readlines
  ``read each line of given filename into list``
  [filename]
  (with [fh (file/open filename)]
    (var lines @[])
    (loop [line :iterate (file/read fh :line)]
      (if (> (length line) 1)
        (array/push lines line))
        nil)
    lines))

(defn cube-counts
  ``each draw has n cube counts delim'd by ', '``
  [draw]
  (let [counts (string/split ", " draw)]
    (map (fn [c] (string/split " " c)) counts)))

(defn is-possible
  [counts]
  (def p (map (fn [c]
          (let [[n color] c]
            (let [max (case color
                        "red"   (inventory :r)
                        "green" (inventory :g)
                        "blue"  (inventory :b))]
              (<= max n))))
              counts)))

(defn check-draws
  ``parse draw portion of line into array``
  [str]
  (let [draws (string/split "; " str)]
    (let [counts (map cube-counts draws)]
      (some is-possible counts))))

(defn get-game
  ``parse line text into a game struct``
  [line]
  (let [[h t] (string/split ": " line)]
    # slice tail to drop newline char
    (let [id (string/slice h -2) draws (string/slice t 0 -2)]
      {:id (int/u64 id) :possible (check-draws draws)})))

(defn main
  [& args]
  (def filename (if (> (length args) 1)
                  (args 1)
                  "input.txt"))
  (def lines (readlines filename))
  (def games (map get-game lines))
  (pp games))
