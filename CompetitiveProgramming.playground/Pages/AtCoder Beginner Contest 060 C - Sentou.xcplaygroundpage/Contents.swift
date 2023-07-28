import Foundation

var n: Int = 0
var secondsOfHotWater: Int = 0
var timesFromFirst: [Int] = []

func inputDemoData() {
    n = 2
    secondsOfHotWater = 4
    timesFromFirst = [
        0,
        5
    ]
}

func inputData() {
    let firstInput = readLine()!.split(separator: " ").map { Int(String($0))! }
    n = firstInput[0]
    secondsOfHotWater = firstInput[1]

    timesFromFirst = readLine()!.split(separator: " ").map { Int(String($0))! }
}

func solve() -> Int {
    var totalTime = 0
    var previousTimeFromFirst = 0

    for i in 0..<n {
        let timeFromPrevious = timesFromFirst[i] - previousTimeFromFirst
        if timeFromPrevious < secondsOfHotWater {
            totalTime += timeFromPrevious
        } else {
            totalTime += secondsOfHotWater
        }

        previousTimeFromFirst = timesFromFirst[i]
    }

    return totalTime + secondsOfHotWater
}

inputDemoData()

let result = solve()
print(result)
