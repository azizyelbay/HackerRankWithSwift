import Foundation

/*
 * Complete the 'countingValleys' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER steps
 *  2. STRING path
 */

func countingValleys(steps: Int, path: String) -> Int {
    var result: Int = 0
    var count: Int = 0
    for ch in path {
        if ch == "D" {
            result -= 1 
        }
        else if ch == "U" {
            result += 1
        }
        if result == 0 {
            if ch != "D" {
                count += 1
            }
            result = 0
        }
        
    }
    return count 

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let steps = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let path = readLine() else { fatalError("Bad input") }

let result = countingValleys(steps: steps, path: path)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
