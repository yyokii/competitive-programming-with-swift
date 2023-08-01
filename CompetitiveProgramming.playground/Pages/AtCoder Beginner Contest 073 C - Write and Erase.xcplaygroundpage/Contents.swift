import Foundation

var n = 0

func inputData() {
    n = Int(readLine()!)!
}

func solve() -> Int {
    var inputNumbers: [Int: Int] = [:]

    for _ in 0..<n {
        let input = Int(readLine()!)!
        inputNumbers[input, default: 0] += 1
    }

    var result = 0
    for count in inputNumbers.values {
        if count % 2 != 0 {
            result += 1
        }
    }

    return result
}

inputData()

let result = solve()
print(result)
