import Foundation

/*
 * Complete the 'miniMaxSum' function below.
 *
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

func miniMaxSum(arr: [Int]) -> Void {
    var sortedArr = arr.sorted()
    var maxSum:Int = 0
    var minSum:Int = 0
    for i in stride(from: 0, to: 4, by: 1) {
        minSum += sortedArr[i]
    }
    
    for i in stride(from: arr.count-1, to: 0, by: -1) {
        maxSum += sortedArr[i]
    } 
    print("\(minSum) \(maxSum)")
}

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == 5 else { fatalError("Bad input") }

miniMaxSum(arr: arr)
