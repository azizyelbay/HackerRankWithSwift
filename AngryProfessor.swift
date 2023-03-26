import Foundation

/*
 * Complete the 'angryProfessor' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts following parameters:
 *  1. INTEGER k
 *  2. INTEGER_ARRAY a
 */

func angryProfessor(k: Int, a: [Int]) -> String {
    var count: Int = 0
    for i in 0..<a.count {
        if a[i] <= 0 {
            count += 1
        }
    }
    if k > count {
        return "YES"
    }
    return "NO"

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for tItr in 1...t {
    guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
    let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

    guard let n = Int(firstMultipleInput[0])
    else { fatalError("Bad input") }

    guard let k = Int(firstMultipleInput[1])
    else { fatalError("Bad input") }

    guard let aTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let a: [Int] = aTemp.split(separator: " ").map {
        if let aItem = Int($0) {
            return aItem
        } else { fatalError("Bad input") }
    }

    guard a.count == n else { fatalError("Bad input") }

    let result = angryProfessor(k: k, a: a)

    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
