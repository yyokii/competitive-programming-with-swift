import Foundation

// 9:53 - 10:15 22min

var inputGrid: [[Int]] = []
let gridRowCount = 3
let gridColumnCount = 3

func inputDemoData() {
    inputGrid = [
        [1, 0, 1],
        [2, 1, 2],
        [1, 0, 1]
    ]
}

func inputData() {
    for _ in 0..<gridRowCount {
        let inputRow = readLine()!.split(separator: " ").map { Int(String($0))! }
        inputGrid.append(inputRow)
    }
}

func solve() -> Bool {
    for n in 0...100 {
        let c11 = inputGrid[0][0]

        let a1 = n
        let b1 = c11 - a1
        guard b1 > -1 else {
            continue
        }

        let c12 = inputGrid[0][1]
        let b2 = c12 - a1
        guard b2 > -1 else {
            continue
        }

        let c13 = inputGrid[0][2]
        let b3 = c13 - a1
        guard b3 > -1 else {
            continue
        }

        // a2の算出とチェック
        let c21 = inputGrid[1][0]
        let a2 = c21 - b1
        guard a2 > -1 else {
            continue
        }

        let c22 = inputGrid[1][1]
        guard c22 == a2 + b2 else {
            continue
        }

        let c23 = inputGrid[1][2]
        guard c23 == a2 + b3 else {
            continue
        }

        // a3の算出とチェック
        let c31 = inputGrid[2][0]
        let a3 = c31 - b1
        guard a3 > -1 else {
            continue
        }

        let c32 = inputGrid[2][1]
        guard c32 == a3 + b2 else {
            continue
        }

        let c33 = inputGrid[2][2]
        guard c33 == a3 + b3 else {
            continue
        }

        return true
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
