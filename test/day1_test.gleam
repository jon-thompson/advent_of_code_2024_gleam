import gleam/io
import gleeunit
import gleeunit/should
import simplifile

pub fn main() {
  gleeunit.main()
}

pub fn day01_test() {
  case simplifile.read(from: "./test/day1_sample.txt") {
    Ok(contents) -> {
      contents
      |> should.equal("horsing around")
    }

    Error(e) -> {
      io.debug(e)

      should.fail()
    }
  }
}
