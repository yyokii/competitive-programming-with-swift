import Foundation

var rCount = 0
var gCount = 0
var bCount = 0
var n = 0

func inputDemoData() {
    rCount = 1
    gCount = 2
    bCount = 3
    n = 4
}

func inputData() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    rCount = input[0]
    gCount = input[1]
    bCount = input[2]
    n = input[3]
}

func solve() -> Int {
    var validCount = 0
    for i in 0...n/rCount {
        for j in 0...n/gCount {

            let sumOfRedAndGreen = (i * rCount)  + (j * gCount)
            let remaining = n - sumOfRedAndGreen

            guard remaining > -1, remaining % bCount == 0 else {
                continue
            }
            validCount += 1
        }
    }

    return validCount
}

inputDemoData()

let result = solve()
print(result)
