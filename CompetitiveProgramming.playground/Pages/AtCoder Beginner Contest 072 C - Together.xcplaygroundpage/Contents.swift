import Foundation

let inputN = Int(readLine()!)!
let inputAs = readLine()!.split(separator: " ").map { Int(String($0))! }

func solve() -> Int? {
  var numberMap: [Int: Int] = [:]

  inputAs.forEach { number in
   numberMap[number - 1, default: 0] += 1
   numberMap[number, default: 0] += 1
   numberMap[number + 1, default: 0] += 1
  }

  let max = numberMap.max { a, b in a.value < b.value }
  return max?.value
}

let result = solve()
if let maxValue = result {
  print(maxValue)
}
