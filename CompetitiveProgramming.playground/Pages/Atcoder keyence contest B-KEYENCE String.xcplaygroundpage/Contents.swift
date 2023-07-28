import Foundation

var s: String = ""

func inputDemoData() {
//    s = "keyofscience"
//    s = "mpyszsbznf"
    s = "ashlfyha"
//    s = "keyence"
//    s = "fasafasfkeyence"
//    s = "keyencefsafadffa"
//    s = "fafafkeyedsfancefsafadffa"
//    s = "keyedsfancefsafadffa"
//    s = "kkeyenceeyence"
}

func inputData() {
    s = readLine()!
}

func solve() -> Bool {
    let validWord = "keyence"
    let validWordCount = validWord.count
    let validWordArray = Array(validWord)

    for i in 0...validWordCount {
        let word = String(s.prefix(i)) + String(s.suffix(validWordCount-i))
        if word == validWord {
            return true
        }
    }

    return false
}

inputDemoData()

let result = solve()
if result {
  print("YES")
} else {
  print("NO")
}

// MARK: TEST

/*
import XCTest

s = "keyencefsafadffa"
let result1 = solve()
XCTAssertTrue(result1)

s = "fasafasfkeyence"
let result2 = solve()
XCTAssertTrue(result2)

s = "keyofscience"
let result3 = solve()
XCTAssertTrue(result3)

s = "keyence"
let result4 = solve()
XCTAssertTrue(result4)

s = "fafafkeyedsfancefsafadffa"
let result5 = solve()
XCTAssertFalse(result5)

s = "keyedsfancefsafadffa"
let result6 = solve()
XCTAssertFalse(result6)

s = "ashlfyha"
let result7 = solve()
XCTAssertFalse(result7)
*/
