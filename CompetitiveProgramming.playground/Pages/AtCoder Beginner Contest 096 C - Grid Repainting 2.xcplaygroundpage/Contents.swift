import Foundation

var h: Int = 1
var w: Int = 1
var gridCanvas: [[String]] = []

func inputDemoData() {
//    h = 3
//    w = 3
//    gridCanvas = [
//        [".", "#", "."],
//        ["#", "#", "#"],
//        [".", "#", "."]
//    ]

    h = 5
    w = 5
    gridCanvas = [
        ["#", ".", "#", ".", "#"],
        [".", "#", ".", "#", "."],
        ["#", ".", "#", ".", "#"],
        [".", "#", ".", "#", "."],
        ["#", ".", "#", ".", "#"]
    ]
}

func inputData() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    h = firstInput[0]
    w = firstInput[1]

    for _ in 0..<h {
        let inputRow = Array(readLine()!).map { String($0) }
        gridCanvas.append(inputRow)
    }
}

func solve() -> Bool {
    for i in 0..<h {
        for j in 0..<w {
            guard canDraw((i,j)) else {
                return false
            }
        }
    }

    return true
}

func canDraw(_ coordinate: (i: Int, j: Int)) -> Bool {
    let target = gridCanvas[coordinate.i][coordinate.j]
    guard target == "#" else {
      return true
    }
  
    // 上
    if coordinate.i - 1 >= 0 {
        let topGrid = gridCanvas[coordinate.i - 1][coordinate.j]
        if topGrid == "#" {
            return true
        }
    }

    // 下
    if coordinate.i + 1 < h {
        let bottomGrid = gridCanvas[coordinate.i + 1][coordinate.j]
        if bottomGrid == "#" {
            return true
        }
    }

    // 左
    if coordinate.j - 1 >= 0 {
        let leftGrid = gridCanvas[coordinate.i][coordinate.j - 1]
        if leftGrid == "#" {
            return true
        }
    }

    // 右
    if coordinate.j + 1 < w {
        let rightGrid = gridCanvas[coordinate.i][coordinate.j + 1]
        if rightGrid == "#" {
            return true
        }
    }

    return false
}


inputDemoData()

let result = solve()
if result {
  print("Yes")
} else {
  print("No")
}
