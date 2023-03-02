import Foundation

/*
 * Complete the 'staircase' function below.
 *
 * The function accepts INTEGER n as parameter.
 */

func staircase(n: Int) -> Void {
    for i in 0..<n {
        for j in 0..<n {
            if j < n - 1 - i {
                print(" ", terminator: "")
            }
            else {
                print("#", terminator: "") 
            }
        }
        print()
    }

}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

staircase(n: n)
