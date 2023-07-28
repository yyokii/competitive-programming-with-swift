import Foundation

let input = Int(readLine()!)!

/*
 n個の整数について、
 初項0
 末項n-1
 の等差数列の和が最大値となる
*/
func solve() -> Int {
  return (input * (input - 1)) / 2
}

let result = solve()
print(result)
