import argv
import gleam/io
import gleam/string
import simplifile

pub fn main() {
  case argv.load().arguments {
    [day] -> {
      let name = "day" <> string.pad_start(day, 2, "0")
      let src_dir = "./src/" <> name
      let src_path = src_dir <> "/" <> name <> ".gleam"

      let assert Ok(_) = simplifile.create_directory(src_dir)
      let assert Ok(_) =
        write_new_file(
          src_path,
          "import gleam/string

pub fn part1(input: String) -> Int {
  string.length(input)
}

pub fn part2(input: String) -> Int {
  2 * string.length(input)
}
",
        )

      io.println("Hello from advent_of_code_2024_gleam day " <> name <> "!")
    }

    _ -> io.println("usage: gleam run <day>")
  }
}

fn write_new_file(path, contents) {
  let assert Ok(_) = simplifile.create_file(path)
  simplifile.write(path, contents)
}
