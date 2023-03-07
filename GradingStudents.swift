import Foundation

/*
 * Complete the 'gradingStudents' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts INTEGER_ARRAY grades as parameter.
 */

func gradingStudents(grades: [Int]) -> [Int] {   
    var newGrades:[Int] = []
    for i in 0..<grades.count {
        if grades[i] >= 38 {
            let nextMultipleOfFive:Int = 5 - (grades[i] % 5) + grades[i]
            if (nextMultipleOfFive - grades[i]) < 3 {
                newGrades.append(nextMultipleOfFive)
                continue
            }
        }
        newGrades.append(grades[i])
    }
    return newGrades;
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let gradesCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var grades = [Int]()

for _ in 1...gradesCount {
    guard let gradesItem = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    grades.append(gradesItem)
}

guard grades.count == gradesCount else { fatalError("Bad input") }

let result = gradingStudents(grades: grades)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
