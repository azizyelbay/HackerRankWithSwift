import Foundation

/*
 * Complete the 'plusMinus' function below.
 *
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

func plusMinus(arr: [Int]) -> Void {
    var zeroCount:Int = 0
    var positiveCount:Int = 0
    var negativeCount:Int = 0
    
    for element in arr {
        if element == 0 {
            zeroCount += 1      
        }
        else if element > 0 {
            positiveCount += 1      
        }
        else {
            negativeCount += 1      
        }
    }
        
    print(String(format: "%.6f",(Float(positiveCount) / Float(arr.count))))
    print(String(format: "%.6f",(Float(negativeCount) / Float(arr.count))))
    print(String(format: "%.6f",(Float(zeroCount) / Float(arr.count))))

}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

plusMinus(arr: arr)
