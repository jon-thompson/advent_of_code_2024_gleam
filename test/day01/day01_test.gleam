import gleeunit
import gleeunit/should
import simplifile

const sample_path: String = "./test/day01/day01_sample.txt"

pub fn main() {
  gleeunit.main()
}

pub fn day01_test() {
  let assert Ok(contents) = simplifile.read(sample_path)

  contents
  |> should.equal("horsing around")
}
