import gleam/string

pub fn part1(input: String) -> Int {
string.length(input)
}

pub fn part2(input: String) -> Int {
2 * string.length(input)
}
