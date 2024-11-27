import gleeunit
import gleeunit/should
import simplifile

pub fn main() {
  gleeunit.main()
}

pub fn day01_test() {
  let assert Ok(contents) = simplifile.read(from: "./test/day1_sample.txt")

  contents
  |> should.equal("horsing around")
}
