// MARK: ロジックの定義

var n = 1
var a = 1
var b = 1

func inputDemoData() {
    n = 1
    a = 3
    b = 3
}

func inputData() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    n = input[0]
    a = input[1]
    b = input[2]
}

protocol Service {
    func calculatePatterns() -> Int
}

struct ServiceImpl: Service {

    let numberCount: Int
    let minNumber: Int
    let maxNumber: Int

    init(
        numberCount: Int,
        minNumber: Int,
        maxNumber: Int
    ) {
        self.numberCount = numberCount
        self.minNumber = minNumber
        self.maxNumber = maxNumber
    }

    func calculatePatterns() -> Int {
       if a <= b {
           if n == 1 {
               return a == b ? 1 : 0
           } else {
               let minSum = a * (n - 1) + b
               let maxSum = b * (n - 1) + a

               return maxSum - minSum + 1
           }
        } else {
            return 0
        }
    }

}

// MARK: 処理の実行

inputDemoData()

let service = ServiceImpl(numberCount: n, minNumber: a, maxNumber: b)
let result = service.calculatePatterns()

print(result)
