// MARK: ロジックの定義

var n = 1
var s = ""
var t = ""

func inputDemoData() {
    n = 3
    s = "abc"
    t = "bce"
}

func inputData() {
    n = Int(readLine()!)!
    s = readLine()!
    t = readLine()!
}

protocol Service {
    func calculateMinWordSize() -> Int
}

struct ServiceImpl: Service {

    let wordCount: Int
    let prefixWord: String
    let suffixWord: String

    func calculateMinWordSize() -> Int {

        var overlapCount = 0

        for i in 1...prefixWord.count {
            let substringS = prefixWord.suffix(i)
            let substringT = suffixWord.prefix(i)

            if substringS == substringT {
                overlapCount = i
            } else {
                continue
            }
        }

        let combinedWord = prefixWord + suffixWord

        return combinedWord.count - overlapCount
    }
}

// MARK: 処理の実行

inputDemoData()

let service = ServiceImpl(wordCount: n, prefixWord: s, suffixWord: t)
let result = service.calculateMinWordSize()

print(result)
