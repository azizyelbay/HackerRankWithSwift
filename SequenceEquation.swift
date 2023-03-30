import Foundation

/*
 * Complete the 'permutationEquation' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts INTEGER_ARRAY p as parameter.
 */

func permutationEquation(p: [Int]) -> [Int] {

    var list: [Int] = []
    for i in stride(from: 1, to: p.count + 1, by: 1) {
        var value: Int = p.index(of: i)! + 1
        var value1: Int = p.index(of: value)! + 1
        list.append(value1)
    }
    return list
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let pTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let p: [Int] = pTemp.split(separator: " ").map {
    if let pItem = Int($0) {
        return pItem
    } else { fatalError("Bad input") }
}

guard p.count == n else { fatalError("Bad input") }

let result = permutationEquation(p: p)

fileHandle.write(result.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
