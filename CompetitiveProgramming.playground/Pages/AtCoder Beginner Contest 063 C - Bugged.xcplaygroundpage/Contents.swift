import Foundation

var n: Int = 0
var scores: [Int] = []

func inputDemoData() {
    n = 3
    scores = [
        5,
        10,
        15
    ]
}

func inputData() {
    n = Int(readLine()!)!

    for _ in 0..<n {
        let input = Int(readLine()!)!
        scores.append(input)
    }
}

func solve() -> Int {
    let sum = scores.reduce(into: 0) { partialResult, score in
        partialResult += score
    }

    if !needCheckNumber(sum) {
        return sum
    }

    var minAdjustmentValue: Int?
    for i in 0..<n {
        let target = scores[i]
        if !needCheckNumber(target) {
            if minAdjustmentValue == nil {
                minAdjustmentValue = target
            } else if let current = minAdjustmentValue {
                minAdjustmentValue = min(current, target)
            }
        }
    }

    if minAdjustmentValue == nil {
        return 0
    } else if let min = minAdjustmentValue {
        return sum - min
    } else {
        fatalError()
    }
}

func needCheckNumber(_ number: Int) -> Bool {
    number % 10 == 0
}

inputDemoData()

let result = solve()
print(result)
