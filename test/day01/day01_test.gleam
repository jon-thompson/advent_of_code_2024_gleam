import day01/day01
import gleeunit/should
import simplifile

const sample_path = "./test/day01/day01_sample.txt"

const puzzle_path = "./test/day01/day01_puzzle.txt"

pub fn day01_part1_sample_test() {
  let assert Ok(contents) = simplifile.read(sample_path)

  contents
  |> day01.part1
  |> should.equal(14)
}

pub fn day01_part1_puzzle_test() {
  let assert Ok(contents) = simplifile.read(puzzle_path)

  contents
  |> day01.part1
  |> should.equal(25)
}

pub fn day01_part2_sample_test() {
  let assert Ok(contents) = simplifile.read(sample_path)

  contents
  |> day01.part2
  |> should.equal(28)
}

pub fn day01_part2_puzzle_test() {
  let assert Ok(contents) = simplifile.read(puzzle_path)

  contents
  |> day01.part2
  |> should.equal(50)
}
