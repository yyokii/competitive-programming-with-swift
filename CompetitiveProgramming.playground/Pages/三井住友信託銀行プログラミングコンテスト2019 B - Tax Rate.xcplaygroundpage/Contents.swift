import Foundation

let inputNumber = Int(readLine()!)!

struct Solver {
  let taxIncludedPrice: Int
  let tax: Double = 1.08

  init(taxIncludedPrice: Int) {
    self.taxIncludedPrice = taxIncludedPrice
  }

  func calculateNotTaxIncluededPrice() -> Int? {
    var result: Int = Int(floor(Double(taxIncludedPrice)/1.08))
    var reCulculatedTaxIncludedPrice: Int = Int(floor(Double(result) * tax))

    if reCulculatedTaxIncludedPrice == taxIncludedPrice {
      return result
    } else {
      result += 1
      reCulculatedTaxIncludedPrice = Int(floor(Double(result) * tax))

      if reCulculatedTaxIncludedPrice == taxIncludedPrice {
        return result
      } else {
        return nil
      }
    }
  }
}

let solver = Solver(taxIncludedPrice: inputNumber)
let result = solver.calculateNotTaxIncluededPrice()

if let result = result {
  print(result)
} else {
  print(":(")
}
