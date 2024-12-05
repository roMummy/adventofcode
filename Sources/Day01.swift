import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [[Int]] {
      data.split(separator: "\n")
          .map { line -> [Int] in
              line.split(separator: " ")
                  .compactMap { Int($0) }
          }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
    // Calculate the sum of the first set of input data
      
      let left = entities.map {$0[0]}.sorted(by: <)
      let right = entities.map {$0[1]}.sorted(by: <)
      
      var sum = 0
      for (i, item) in left.enumerated() {
          sum += abs(item - right[i])
      }
      
      return sum
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
      let left = entities.map {$0[0]}
      let right = entities.map {$0[1]}
      
      let map = right.reduce(into: [Int:Int]()) { result, value in
          result[value, default: 0] += 1
      }
      
      return left.reduce(into: 0) { sum, value in
          sum += (map[value] ?? 0) * value
      }
  }
}
