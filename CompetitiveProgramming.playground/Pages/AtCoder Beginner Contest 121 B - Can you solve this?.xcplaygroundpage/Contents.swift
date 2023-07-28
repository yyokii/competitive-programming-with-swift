import Foundation

let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }

let inputN = firstInput[0]
let inputM = firstInput[1]
let inputC = firstInput[2]

let inputBArray = readLine()!.split(separator: " ").map { Int(String($0))! }

var allAArray: [[Int]] = []
for _ in 0..<inputN {
  let inputAArray = readLine()!.split(separator: " ").map { Int(String($0))! }
  allAArray.append(inputAArray)
}

func solve() -> [Int] {
  var passedCodes: [Int] = []

  for i in 0..<inputN {
    // 各ソースコードが条件を満たすかのチェック
    var score: Int = 0
    let targetCode = allAArray[i]
    for m in 0..<inputM {
      score += targetCode[m] * inputBArray[m]
    }
    score += inputC

    if score > 0 {
      passedCodes.append(i)
    }
  }
  return passedCodes
}

let passedCodes = solve()
print(passedCodes.count)
