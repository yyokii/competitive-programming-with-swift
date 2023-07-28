let inputNumbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let inputS = readLine()!
let participantsArray = Array(inputS)

let totalParticipants = inputNumbers[0]
let passableNumber = inputNumbers[1] + inputNumbers[2]
let maxPassableOverseasStudents = inputNumbers[2]

public enum StudentType {
  case domestic
  case overseas
  case other
}

public struct Student {
  let type: StudentType

  init(with code: String) {
    if code == "a" {
      self.type = .domestic
    } else if code == "b" {
      self.type = .overseas
    } else {
      self.type = .other
    }
  }
}

protocol Contest {
  func generateResult()
  func checkIfPassedPreliminaries(student: Student) -> Bool
}

final class AContest: Contest {
  let passableNumber: Int
  let maxPassableOverseasStudents: Int
  private var participants: [Student]

  private (set) var result: [String] = []

  private var currentPassedCount: Int = 0
  private var currentPassedOverseasStudentsCount: Int = 0

  init(passableNumber: Int, maxPassableOverseasStudents: Int, participants: [Student]) {
    self.passableNumber = passableNumber
    self.maxPassableOverseasStudents = maxPassableOverseasStudents
    self.participants = participants
  }

  func generateResult() {
    participants.forEach { student in
      if checkIfPassedPreliminaries(student: student) {
        currentPassedCount += 1
        if student.type == .overseas {
          currentPassedOverseasStudentsCount += 1
        }
        result.append("Yes")
      } else {
        result.append("No")
      }
    }
  }

  func checkIfPassedPreliminaries(student: Student) -> Bool {
    guard passableNumber > currentPassedCount else {
      return false
    }

    guard student.type != .other else {
      return false
    }

    if student.type == .overseas
    && currentPassedOverseasStudentsCount < maxPassableOverseasStudents
     {
      return true
    } else if student.type == .domestic {
      return true
    } else {
      return false
    }
  }
}

let participants: [Student] = participantsArray.map { code in
  Student(with: "\(code)")
}

let currentContest = AContest(
  passableNumber: passableNumber,
  maxPassableOverseasStudents: maxPassableOverseasStudents,
  participants: participants
)

currentContest.generateResult()
currentContest.result.forEach { resultData in
  print(resultData)
}
