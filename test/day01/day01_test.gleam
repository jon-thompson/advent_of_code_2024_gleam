import day01/day01
import gleeunit
import gleeunit/should
import simplifile

const sample_path = "./test/day01/day01_sample.txt"

pub fn main() {
  gleeunit.main()
}

pub fn day01_part1_test() {
  let assert Ok(contents) = simplifile.read(sample_path)

  contents
  |> day01.part1
  |> should.equal(14)
}

pub fn day01_part2_test() {
  let assert Ok(contents) = simplifile.read(sample_path)

  contents
  |> day01.part2
  |> should.equal(28)
}
