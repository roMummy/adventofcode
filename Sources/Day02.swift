import Algorithms

struct Day02: AdventDay {
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
      let result = entities.filter { line in
          // 记录上一个元素
          var p = line.first!
          // 上一次的值
          var last = 0
          for item in line[1..<line.count] {
              let value = item - p
              p = item
              
              // 不是正序或者倒序 淘汰
              if last * value < 0 {
                  return false
              }
              
              last = value
              
              // 0 和大于3 淘汰
              if value == 0 || abs(value) > 3 {
                  return false
              }
          }
          return true
      }
      
      return result.count
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
      let result = entities.filter { line in
          // 判断是否安全
          func isLineSafe(_ line: [Int]) -> Bool {
             // 记录上一个元素
             var p = line.first!
             // 上一次的值
             var last = 0
             for item in line[1..<line.count] {
                 let value = item - p
                 p = item
                 
                 // 不满足单调性，淘汰
                 if last * value < 0 {
                     return false
                 }
                 
                 last = value
                 
                 // 差值为 0 或大于 3，淘汰
                 if value == 0 || abs(value) > 3 {
                     return false
                 }
             }
             return true
          }
          // 如果当前行本身安全，直接返回 true
          if isLineSafe(line) {
              return true
          }
          // 一个一个元素移除试一下 如果有安全的就代表安全
          for i in 0..<line.count {
              var tempLine = line
              tempLine.remove(at: i)
              if isLineSafe(tempLine) {
                  return true
              }
          }
          // 所有都不满足 不安全
          return false
      }
      
      return result.count
  }
}
