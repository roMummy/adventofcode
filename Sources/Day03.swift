import Algorithms
import Foundation

extension String {
    func matches(pattern: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let matches = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            
            // 提取匹配的字符串
            let results = matches.map {
                String(self[Range($0.range, in: self)!])
            }
            
            // 输出结果
            return results
        } catch {
            print("正则错误: \(error)")
            return []
        }
    }
}

struct Day03: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
      // Calculate the sum of the first set of input data
      // mul(xxx,xxx)
      func searchMuls() -> [Int] {
          let pattern = #"mul\(\d{1,3},\d{1,3}\)"#
          return data.matches(pattern: pattern)
              .map {
                  let numberString = $0.dropFirst(4).dropLast()
                  let arr = numberString.split(separator: ",").compactMap{Int($0)}
                  return arr.first! * arr.last!
              }
      }
      
      return searchMuls().reduce(0, +)
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
    // Sum the maximum entries in each set of data
      // mul(xxx,xxx) or do() don't()
      func searchMuls() -> [Int] {
          let pattern = #"mul\(\d{1,3},\d{1,3}\)|do\(\)|don't\(\)"#
          let arr = data.matches(pattern: pattern)
          var newArr: [String] = []
          var canDo = true
          // do() 后面的指令正常执行 don't()后面的指令不执行
          for item in arr {
              if item == "don't()" {
                  canDo = false
                  continue
              }
              
              if item == "do()" {
                  canDo = true
                  continue
              }
              
              if canDo {
                  newArr.append(item)
              }
          }
          
          
          return newArr
              .map {
                  let numberString = $0.dropFirst(4).dropLast()
                  let arr = numberString.split(separator: ",").compactMap{Int($0)}
                  return arr.first! * arr.last!
              }
      }
      
      return searchMuls().reduce(0, +)
  }
}
