import Foundation

let inputNumbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let inputA = inputNumbers[0]
let inputB = inputNumbers[1]
let inputC = inputNumbers[2]

func solve() -> Bool {
  let upperBound = inputA * inputB
  for i in 1...upperBound {
    let remainder = (inputA * i) % inputB
    if remainder == inputC {
      return true
    }
  }
  return false
}

let result = solve()
if result {
  print("YES")
} else {
  print("NO")
}
