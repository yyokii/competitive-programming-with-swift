import Foundation

let inputN = Int(readLine()!)!
let inputS = readLine()!
let inputSArray = Array(inputS)

/*
 どこで区切るかの全探索を行い、各ケースにおいてa~zのループを回し両方に含まれる場合にcountを更新する。そしてその合計値の比較をし、最大値を返す。
*/
func solve() -> Int {
  var maxCount = 0

  for i in 0..<inputN - 1 {
    var count = 0

    for char in "abcdefghijklmnopqrstuvwxyz" {
      var isIncludedLeftString = false
      var isIncludedRightString = false

      for l in 0..<i + 1 {
        // 左の文字列
        let target = inputSArray[l]
        if target == char {
          isIncludedLeftString = true
        }
      }

      for r in i + 1..<inputN {
        // 右の文字列
        let target = inputSArray[r]
        if target == char {
          isIncludedRightString = true
        }
      }

      if isIncludedLeftString && isIncludedRightString {
        count += 1
      }
    }

    maxCount = max(maxCount, count)
  }

  return maxCount
}

let result = solve()
print(result)
