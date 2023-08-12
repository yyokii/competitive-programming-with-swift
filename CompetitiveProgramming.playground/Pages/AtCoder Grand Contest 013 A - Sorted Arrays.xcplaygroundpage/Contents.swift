// MARK: ロジックの定義

var n = 1
var inputNumbers: [Int] = []

func inputDemoData() {
    n = 9
    inputNumbers = [1, 2, 1, 2, 1, 2, 1, 2, 1]
}

func inputData() {
    n = Int(readLine()!)!
    inputNumbers = readLine()!.split(separator: " ").map { Int(String($0))! }
}

protocol Service {
    func calculateMinSeparatePatterns() -> Int
}

struct ServiceImpl: Service {

    let inputNumbers: [Int]

    func calculateMinSeparatePatterns() -> Int {
        var count = 0
        var isIncrease: Bool?

        for i in 0..<(inputNumbers.count - 1) {
            let currentNumber = inputNumbers[i]
            let nextNumber = inputNumbers[i + 1]

            if currentNumber < nextNumber {
                if let isIncreaseValue = isIncrease, !isIncreaseValue {
                    isIncrease = nil
                    count += 1
                } else if isIncrease == nil {
                    isIncrease = true
                }
            } else if currentNumber > nextNumber {
                if let isIncreaseValue = isIncrease, isIncreaseValue {
                    isIncrease = nil
                    count += 1
                } else if isIncrease == nil {
                    isIncrease = false
                }
            }
        }

        return count + 1
    }
}

// MARK: 処理の実行

inputDemoData()

let service = ServiceImpl(inputNumbers: inputNumbers)
let result = service.calculateMinSeparatePatterns()

print(result)
