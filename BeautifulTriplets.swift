import Foundation

/*
 * Complete the 'beautifulTriplets' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER d
 *  2. INTEGER_ARRAY arr
 */

func beautifulTriplets(d: Int, arr: [Int]) -> Int {
    var count = 0
    var numCounts = [Int: Int]()
    
    // populate the numCounts dictionary
    for num in arr {
        if let count = numCounts[num] {
            numCounts[num] = count + 1
        } else {
            numCounts[num] = 1
        }
    }
    
    // iterate over the keys of the numCounts dictionary
    for num in numCounts.keys {
        if let count1 = numCounts[num], 
           let count2 = numCounts[num+d],
           let count3 = numCounts[num+2*d] {
            count += count1 * count2 * count3
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

guard let d = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

let result = beautifulTriplets(d: d, arr: arr)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
