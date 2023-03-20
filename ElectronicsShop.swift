import Foundation

/*
 * Complete the getMoneySpent function below.
 */
func getMoneySpent(keyboards: [Int], drives: [Int], b: Int) -> Int {
    var list: [Int] = []
    
    for elementKeyboard in keyboards {
        for elementDrive in drives {
            let sum = elementKeyboard + elementDrive
            if sum <= b {
                list.append(sum)
            }
        }
    }
    
    list.sort()
    if !list.isEmpty {
        return list[list.count - 1]
    }
    return -1
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let bnmTemp = readLine() else { fatalError("Bad input") }
let bnm = bnmTemp.split(separator: " ").map{ String($0) }

guard let b = Int(bnm[0].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let n = Int(bnm[1].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let m = Int(bnm[2].trimmingCharacters(in: .whitespacesAndNewlines))
else { fatalError("Bad input") }

guard let keyboardsTemp = readLine() else { fatalError("Bad input") }
let keyboards: [Int] = keyboardsTemp.split(separator: " ").map {
    if let keyboardsItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return keyboardsItem
    } else { fatalError("Bad input") }
}

guard keyboards.count == n else { fatalError("Bad input") }

guard let drivesTemp = readLine() else { fatalError("Bad input") }
let drives: [Int] = drivesTemp.split(separator: " ").map {
    if let drivesItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
        return drivesItem
    } else { fatalError("Bad input") }
}

guard drives.count == m else { fatalError("Bad input") }

/*
 * The maximum amount of money she can spend on a keyboard and USB drive, or -1 if she can't purchase both items
 */

let moneySpent = getMoneySpent(keyboards: keyboards, drives: drives, b: b)

fileHandle.write(String(moneySpent).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
