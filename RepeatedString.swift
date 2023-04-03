import Foundation

/*
 * Complete the 'repeatedString' function below.
 *
 * The function is expected to return a LONG_INTEGER.
 * The function accepts following parameters:
 *  1. STRING s
 *  2. LONG_INTEGER n
 */

func repeatedString(s: String, n: Int) -> Int {
    var result: Int = 0
    var count: Int = 0
    for element in s {
        if element == "a" {
            count += 1
        }
    }
    let totalString = Int(n) / Int(s.count) 
    let remainder = n - (totalString * Int(s.count));
    result = Int(count) * totalString;
    for i in stride(from: 0, to: remainder, by: 1) {
        if s[s.index(s.startIndex, offsetBy: i)] == "a" {
            result += 1
        }
    }
    return result
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let s = readLine() else { fatalError("Bad input") }

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = repeatedString(s: s, n: n)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
