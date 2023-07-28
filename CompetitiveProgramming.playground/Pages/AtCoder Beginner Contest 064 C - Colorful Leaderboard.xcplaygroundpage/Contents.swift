import Foundation

let inputN = Int(readLine()!)!
let inputNumbers = readLine()!.split(separator: " ").map { Int(String($0))! }

enum RateColor {
    case grey
    case brown
    case green
    case lightBlue
    case blue
    case yellow
    case orange
    case red
    case custom

    init(rate: Int) {
        switch rate {
        case 0..<400:
            self = .grey
        case 400..<800:
            self = .brown
        case 800..<1200:
            self = .green
        case 1200..<1600:
            self = .lightBlue
        case 1600..<2000:
            self = .blue
        case 2000..<2400:
            self = .yellow
        case 2400..<2800:
            self = .orange
        case 2800...3199:
            self = .red
        case 3200...:
            self = .custom
        default:
            self = .grey
        }
    }
}

func solve() -> (min: Int, max: Int) {
  var colorsCount: [RateColor: Int] = [:]

  inputNumbers.forEach { rate in
   let rateColor = RateColor(rate: rate)
   colorsCount[rateColor, default: 0] += 1
  }

  if colorsCount.keys.contains(RateColor.custom) {
    if colorsCount.count > 1 {
      return (
        colorsCount.count - 1,
        colorsCount.count - 1 + (colorsCount[RateColor.custom] ?? 0)
      )
    } else {
      return (1, (colorsCount[RateColor.custom] ?? 0))
    }
  } else {
    let value = colorsCount.count
    return (value, value)
  }
}

let result = solve()
print("\(result.min) \(result.max)")
