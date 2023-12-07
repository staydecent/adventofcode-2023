import os

fn check_game(line string) (int, string) {
    parts := line.split(': ')
    id := parts[0].split(' ')[1].int()
    draws := parts[1].split('; ').map(fn (d string) []string {
        return d.split(', ')
    })
    println(id)
    println(draws)
    return id, parts[1]
}

fn main() {
    mut filename := 'input.txt'

    if os.args.len > 1 {
        filename = os.args[1]
    }

    text := os.read_file(filename) or {
        eprintln('failed to read the file: ${err}')
        return
    }

    lines := text.split_into_lines()
    for line in lines {
        if line.starts_with('Game') {
            id, possible := check_game(line) 
        }
    }
}

