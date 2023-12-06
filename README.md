# Advent of Code 2023

Or how I'm attempting to get cozy with a lisp (And maybe some other languages too)!

[Aoc Website](https://adventofcode.com/2023)

# Language Impressions (...thus far)

## [CHICKEN](https://call-cc.org/)

I love the vibe of CHICKEN. The name, the logo, the intention. Easy to install on debian/ubuntu. Easy REPL. And what looks to be easy portable binaries. However, I'm not that interested in optimizing low-level functions. I'm really just intrigued by lisps and would like a convenient scripting language that can produce small, portable binaries. The [verbosity](https://stackoverflow.com/questions/16335454/reading-from-file-using-scheme) of creating a readLines type function is a bit daunting. Especially when coming from [Python](https://stackoverflow.com/questions/3277503/how-to-read-a-file-line-by-line-into-a-list/35622867#35622867). I'm not totally writing CHICKEN off yet, but I'm going to switch over to Janet to see if there is a gap in difficulty for this initial challenge. I may try other Scheme's or Lisps to get the feel for something more "traditional" than Janet.

## [Janet](https://janet-lang.org/)

While creating a portable binary isn't as well documented, [this discussion](https://github.com/janet-lang/janet/discussions/818) seems promising. In any case, Janet is so small and easy to install, it's not really a problem for writing scripts for my own use.

The Janet docs are quite nice and are even suplemented with community docs. I love this. Anyway, figuring out file reading and args parsing was quite easy. Similar APIs to Python. Where it got interesting is Regex situation. Janet implements PEGs, and seems to have a wrapper on the PEG system to offer a Regex like API. However, I opted to try out the [PEG API directly](https://janetdocs.com/peg/find-all).

After completing Day 1, I'm quite smitten. PEGs are still a bit beyond me, but I was able to find others' discussing them for AoC in their [Zulip channel](https://janet.zulipchat.com/).

## [Crystal](https://crystal-lang.org/)

I didn't like it. On initial impression,  I'm not a huge fan of method overloading. Figuring out which "version" of [gsub](https://crystal-lang.org/api/1.10.1/String.html#gsub%28string%3AString%2C%26%29%3AString-instance-method) would work best for me was tiresome. I'm also realizing I just don't like `end`.. how is this better than curly braces? It reminded me why Ruby never grabbed hold of me. I much rather just use a curly bracket language than deal with `do`, `end` but also sometimes curly brackets and parenthesis and `|`. Just feels like too much syntax for my taste.

## [Nim](https://nim-lang.org/)

I like it! The look of it makes me think of Haskell + Python. [Procedures](https://narimiran.github.io/nim-basics/#_procedures) are quite neat, especially the `result` keyword. 
