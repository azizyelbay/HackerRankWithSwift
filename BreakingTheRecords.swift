import Foundation

/*
 * Complete the 'breakingRecords' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts INTEGER_ARRAY scores as parameter.
 */

func breakingRecords(scores: [Int]) -> [Int] {
    var results: [Int] = []
    var minCount: Int = 0
    var maxcount: Int = 0
    var minValue: Int = scores[0]
    var maxValue: Int = scores[0]    
    for element in scores {
        if minValue > element {
            minCount += 1
            minValue = element
        }
        if maxValue < element {
            maxcount += 1
            maxValue = element
        }
        
    }
    results.append(maxcount)
    results.append(minCount)
    return results

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let scoresTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let scores: [Int] = scoresTemp.split(separator: " ").map {
    if let scoresItem = Int($0) {
        return scoresItem
    } else { fatalError("Bad input") }
}

guard scores.count == n else { fatalError("Bad input") }

let result = breakingRecords(scores: scores)

fileHandle.write(result.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
