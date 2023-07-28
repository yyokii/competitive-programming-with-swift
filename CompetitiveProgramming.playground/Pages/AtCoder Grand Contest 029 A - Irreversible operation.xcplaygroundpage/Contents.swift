import Foundation

let input = readLine()!
let inputArray = Array(input)

func solve() -> Int {
  // それぞれのWの左側に幾つのBが存在するかを数え、それを合計する

  let arraySize = inputArray.count

  var bCount: Int = 0
  var result: Int = 0

  for i in 0..<arraySize {
    let target = inputArray[i]

    if target == "B" {
      bCount += 1
    } else if target == "W" {
      result += bCount
    }
  }

  return result
}

let result = solve()
print(result)
