import Foundation

class CoronaClass {
    
    var seats = [Int]()
    private let n: Int
    
    init(n: Int) {
        self.n = n
    }
    
    func seat() -> Int {
        if seats.isEmpty
        {
            seats.append(0)
            return 0
        }
        if seats.count == n {
            return -1
        }
        var disArray = [(min:Int, i: Int, j: Int)]()
        for i in 1..<seats.count{
            if seats[i-1] + 1 == seats[i] {
                continue
            }
            var minDistance = (seats[i] + seats[i-1]) / 2
            minDistance = min(minDistance - seats[i-1], seats[i] - minDistance)
            disArray.append((minDistance, i-1, i))
        }
        let leftRange = seats[0] - 0
        let rightRange = (n-1) - seats.last!
        let maxTuple = disArray.max(by: {$0.min < $1.min})
        let maxRange = maxTuple?.min ?? 0

            if leftRange >= rightRange && leftRange >= maxRange {
                seats.insert(0, at: 0)
                return 0
            }
            else if maxRange >= rightRange {
                let (_, i, j) = maxTuple!
                let value = (seats[i] + seats[j])/2
                seats.insert(value, at: j)
                return value
                
            }
            else {
                seats.append(n-1)
                return n-1
            }
    }
    
    func leave(_ p: Int) {
        if !seats.isEmpty{
            seats.removeAll(where: {$0 == p})
        }
    }
}
