import argv
import gleam/io

pub fn main() {
  case argv.load().arguments {
    [day] ->
      io.println("Hello from advent_of_code_2024_gleam day " <> day <> "!")

    _ -> io.println("usage: gleam run <day>")
  }
}
