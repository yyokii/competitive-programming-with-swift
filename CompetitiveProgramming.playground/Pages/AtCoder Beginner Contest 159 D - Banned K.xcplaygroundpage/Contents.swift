import Foundation

var n = 0
var inputBalls: [Int] = []

func inputDemoData() {
    n = 5
    inputBalls = [
        1,
        1,
        2,
        1,
        2
    ]
}

func inputData() {
    n = Int(readLine()!)!
    inputBalls = readLine()!.split(separator: " ").map { Int(String($0))! }
}

func solve() {
    var numbers: [Int: Int] = [:]

    for i in 0..<n {
        let number = inputBalls[i]
        numbers[number, default: 0] += 1
    }

    var totalCount = 0
    for key in numbers.keys {
        var numberCount = 0
        numberCount = (numbers[key] ?? 0)

        let patterns = (numberCount * (numberCount - 1)) / 2
        totalCount += patterns
    }

    for j in 0..<n {
        let removeNumber = inputBalls[j]
        guard let numberCount = numbers[removeNumber] else {
            continue
        }

        let patterns = (numberCount * (numberCount - 1)) / 2
        let removedNumberPatterns = ((numberCount - 1) * (numberCount - 2)) / 2
        let diff = patterns - removedNumberPatterns
        let output = totalCount - diff
        print(output)
    }
}

inputDemoData()

let _ = solve()
