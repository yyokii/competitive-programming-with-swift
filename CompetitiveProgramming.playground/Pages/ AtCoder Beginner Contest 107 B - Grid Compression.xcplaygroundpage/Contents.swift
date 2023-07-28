import Foundation

let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
let h = firstInput[0]
let w = firstInput[1]

var inputGrid: [[String]] = []

var hasBlackRows: Set<Int> = []
var hasBlackColumns: Set<Int> = []

// マス目情報の読み取り
for _ in 0..<h {
  let inputRow = readLine()!
  let inputRowArray = Array(inputRow).map {
    String($0)
  }
  inputGrid.append(inputRowArray)
}

func solve() {
  // Blackが存在する行,列のチェック
  for h in 0..<h {
    for w in 0..<w {
      let target: String = inputGrid[h][w]
      if isBlack(code: target) {
        hasBlackRows.insert(h)
        hasBlackColumns.insert(w)
      }
    }
  }

  for h in 0..<h {
    var rowOutput = ""
    for w in 0..<w {
      if hasBlackRows.contains(h) && hasBlackColumns.contains(w) {
        rowOutput += inputGrid[h][w]
      }
    }
    if !rowOutput.isEmpty {
      print(rowOutput)
    }
  }
}

func isBlack(code: String) -> Bool {
  return code == "#"
}

solve()
