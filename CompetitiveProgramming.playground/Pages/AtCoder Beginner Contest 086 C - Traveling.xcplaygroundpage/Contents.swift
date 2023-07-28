import Foundation

typealias plan = (time: Int, x: Int, y: Int)

var n: Int = 0
var plans:[plan] = []

func inputData() {
    let n = Int(readLine()!)!

    typealias plan = (time: Int, x: Int, y: Int)
    var plans:[plan] = []

    for _ in 0..<n {
        let inputPlan = readLine()!.split(separator: " ").map { Int(String($0))! }
        let plan: plan = (time: inputPlan[0],x: inputPlan[1], y: inputPlan[2])
        plans.append(plan)
    }
}

func inputDemoData() {
    n = 2
    plans = [
        (time: 4, x: 2, y: 2),
        (time: 6, x: 0, y: 0)
    ]
}

var previousPlan: plan = (time: 0, x: 0, y: 0)

func solve() -> Bool {
    for i in 0..<n {
        let currentPlan = plans[i]
        if !checkIsValidCondition(previousPlan: previousPlan, currentPlan: currentPlan) {
            return false
        }

        previousPlan = currentPlan
    }
    return true
}

func checkIsValidCondition(previousPlan: plan, currentPlan: plan) -> Bool {
    let timeDiff = currentPlan.time - previousPlan.time

    let previousPlanXYTotal = previousPlan.x + previousPlan.y
    let currentPlanXYTotal = currentPlan.x + currentPlan.y
    let positionDiff = abs(previousPlanXYTotal - currentPlanXYTotal)

    let bothOdd = (isOdd(timeDiff) && isOdd(positionDiff))
    let bothNotOdd = !isOdd(timeDiff) && !isOdd(positionDiff)

    if positionDiff <= timeDiff {
        if !bothOdd && !bothNotOdd {
            return false
        } else {
            return true
        }
    } else {
        return false
    }
}

func isOdd(_ number: Int) -> Bool {
    number % 2 == 0
}


inputDemoData()
let result = solve()
if result {
  print("Yes")
} else {
  print("No")
}
