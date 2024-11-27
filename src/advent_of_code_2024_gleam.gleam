import argv
import gleam/io
import gleam/string
import simplifile

pub fn main() {
  case argv.load().arguments {
    [day] -> {
      let name = string.pad_start(day, 2, "0")
      let path = "./src/" <> name <> "/" <> name <> ".gleam"

      let assert Ok(_) = simplifile.create_directory("./src/" <> name)

      let assert Ok(_) = simplifile.create_file(path)
      let assert Ok(_) = simplifile.write(path, "hey")
      io.println("Hello from advent_of_code_2024_gleam day " <> name <> "!")
    }

    _ -> io.println("usage: gleam run <day>")
  }
}
