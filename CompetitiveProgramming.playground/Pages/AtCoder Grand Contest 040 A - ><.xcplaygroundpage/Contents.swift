import Foundation

let input = readLine()!
let inputArray = Array(input)

/*
 ><のところは0となることができ、それが最小
 * 左からみていき<となる場合は直前の値+1をいれ、それ以外は0とする
 * 右からみていき>となる場合はmax(すでにある値, 直前の値+1)をいれる
*/
func solve() -> [Int] {

  let arraySize = inputArray.count

  /*
   size: arraySize + 1
   index: 0 ~ arraySize
   となる非負数列
  */
  var nonNegativeArray: [Int] = Array(repeating: 0, count: arraySize + 1)

  // 左から値を設定
  for i in 0..<arraySize {
    nonNegativeArray[0] = 0

    let current = inputArray[i]
    if current == "<" {
      nonNegativeArray[i+1] = nonNegativeArray[i] + 1
    } else if current == ">" {
      nonNegativeArray[i+1] = 0
    }
  }

  // 右から値を設定
  for i in 0..<arraySize {
    let index = (arraySize - 1) - i

    let current = inputArray[index]
    if current == ">" {
      nonNegativeArray[index] = max(nonNegativeArray[index], nonNegativeArray[index + 1] + 1)
    }
  }

  return nonNegativeArray
}

let resultArray = solve()
let result = resultArray.reduce(0, +)
print(result)
