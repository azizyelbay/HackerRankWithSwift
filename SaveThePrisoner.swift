import Foundation

/*
 * Complete the 'saveThePrisoner' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER n
 *  2. INTEGER m
 *  3. INTEGER s
 */

func saveThePrisoner(n: Int, m: Int, s: Int) -> Int {
    var remainder: Int = m % n
    
    if (remainder + s - 1) % n == 0 {
        return n
    }
    else {
        return (remainder + s - 1) % n 
    }

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

    guard let m = Int(firstMultipleInput[1])
    else { fatalError("Bad input") }

    guard let s = Int(firstMultipleInput[2])
    else { fatalError("Bad input") }

    let result = saveThePrisoner(n: n, m: m, s: s)

    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
