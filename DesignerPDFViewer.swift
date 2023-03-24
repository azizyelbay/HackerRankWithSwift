import Foundation

/*
 * Complete the 'designerPdfViewer' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER_ARRAY h
 *  2. STRING word
 */

func designerPdfViewer(h: [Int], word: String) -> Int {
     var ans = 0

        for w in word {
            ans = max(ans, h[Int((w.asciiValue ?? 0) - 97)])
        }

        return ans * word.count

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let hTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let h: [Int] = hTemp.split(separator: " ").map {
    if let hItem = Int($0) {
        return hItem
    } else { fatalError("Bad input") }
}

guard h.count == 26 else { fatalError("Bad input") }

guard let word = readLine() else { fatalError("Bad input") }

let result = designerPdfViewer(h: h, word: word)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
