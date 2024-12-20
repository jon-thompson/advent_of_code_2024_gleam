import argv
import gleam/io
import gleam/result
import gleam/string
import simplifile

pub fn main() {
  case argv.load().arguments {
    [day] -> {
      let name = "day" <> string.pad_start(day, 2, "0")

      result.all([write_src_file(name), write_test_files(name)])
      |> result.map(fn(_) { io.println(name <> " generated!") })
      |> result.lazy_unwrap(fn() { io.println("Ruh roh!") })
    }

    _ -> io.println("usage: gleam run <day>")
  }
}

fn write_src_file(name) {
  let src_dir = "./src/" <> name
  let src_path = src_dir <> "/" <> name <> ".gleam"

  simplifile.create_directory(src_dir)
  |> result.then(fn(_) {
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
  })
}

fn write_test_files(name) {
  let dir = "./test/" <> name

  simplifile.create_directory(dir)
  |> result.then(fn(_) {
    result.all([
      write_new_file(dir <> "/" <> name <> "_puzzle.txt", ""),
      write_new_file(dir <> "/" <> name <> "_sample.txt", ""),
      write_new_file(
        dir <> "/" <> name <> "_test.gleam",
        "
import {name}/{name}
import gleeunit/should
import simplifile

const sample_path = \"./test/{name}/{name}_sample.txt\"

const puzzle_path = \"./test/{name}/{name}_puzzle.txt\"

pub fn {name}_part1_sample_test() {
  let assert Ok(contents) = simplifile.read(sample_path)

  contents
  |> {name}.part1
  |> should.equal(14)
}

pub fn {name}_part1_puzzle_test() {
  let assert Ok(contents) = simplifile.read(puzzle_path)

  contents
  |> {name}.part1
  |> should.equal(25)
}

pub fn {name}_part2_sample_test() {
  let assert Ok(contents) = simplifile.read(sample_path)

  contents
  |> {name}.part2
  |> should.equal(28)
}

pub fn {name}_part2_puzzle_test() {
  let assert Ok(contents) = simplifile.read(puzzle_path)

  contents
  |> {name}.part2
  |> should.equal(50)
}
"
          |> string.replace("{name}", name)
          |> io.debug,
      ),
    ])
  })
  |> result.map(fn(_) { Nil })
}

fn write_new_file(path, contents) {
  simplifile.create_file(path)
  |> result.then(fn(_) { simplifile.write(path, contents) })
}
