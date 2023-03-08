import Foundation

/*
 * Complete the 'kangaroo' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts following parameters:
 *  1. INTEGER x1
 *  2. INTEGER v1
 *  3. INTEGER x2
 *  4. INTEGER v2
 */

func kangaroo(x1: Int, v1: Int, x2: Int, v2: Int) -> String {
    if v1 > v2 {
        let reminder = (x1 - x2) % (v1-v2)
        if reminder == 0 {
            return "YES"
        }
    }

    return "NO"
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let x1 = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let v1 = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

guard let x2 = Int(firstMultipleInput[2])
else { fatalError("Bad input") }

guard let v2 = Int(firstMultipleInput[3])
else { fatalError("Bad input") }

let result = kangaroo(x1: x1, v1: v1, x2: x2, v2: v2)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
