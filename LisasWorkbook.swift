import Foundation

/*
 * Complete the 'workbook' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER n
 *  2. INTEGER k
 *  3. INTEGER_ARRAY arr
 */

func workbook(n: Int, k: Int, arr: [Int]) -> Int {
    var page = 0
    var count = 0
    
    for i in stride(from: 0, to: n, by: 1) {
        for j in stride(from: 1, to: arr[i] + 1, by: 1) {
            if j % k == 1 || k == 1 {
                page += 1
            }
            if page == j {
                count += 1
            }
        }
    }
    return count
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let n = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let k = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

let result = workbook(n: n, k: k, arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
