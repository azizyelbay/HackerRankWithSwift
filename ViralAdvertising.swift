import Foundation

/*
 * Complete the 'viralAdvertising' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts INTEGER n as parameter.
 */

func viralAdvertising(n: Int) -> Int {
    var like = 0;
    var cumulativeLike = 0;
    var shared = 5;
    for _ in stride(from: 1, to: n+1, by: 1) {
        like = shared/2;
       cumulativeLike = cumulativeLike + like;
       shared = like * 3;
    }
return cumulativeLike;
    

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = viralAdvertising(n: n)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
