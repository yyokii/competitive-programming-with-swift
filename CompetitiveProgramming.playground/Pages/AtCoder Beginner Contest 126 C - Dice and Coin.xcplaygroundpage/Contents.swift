// MARK: ロジックの定義

var n = 1
var k = 1

func inputDemoData() {
    n = 100000
    k = 5
}

func inputData() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    n = input[0]
    k = input[1]
}

protocol Service {
    func calculateWinRatio() -> Double
}

struct GameService: Service {

    let maxNumber: Int
    let gameEndScore: (min: Int, max: Int)

    init(
        maxNumber: Int,
        gameEndScore: (min: Int, max: Int)
    ) {
        self.maxNumber = maxNumber
        self.gameEndScore = gameEndScore
    }

    func calculateWinRatio() -> Double {

        var ratioSum: Double = 0

        for score in 1...maxNumber {
            var currentScore = score
            var ratio: Double = 1 / Double(maxNumber)
            while currentScore < gameEndScore.max {
                currentScore *= 2
                ratio *= 1 / 2
            }
            ratioSum += ratio
        }

        return ratioSum
    }

}

// MARK: 処理の実行

inputDemoData()

let gameService = GameService(maxNumber: n, gameEndScore: (min: 1, max: k))
let result = gameService.calculateWinRatio()

print(result)
