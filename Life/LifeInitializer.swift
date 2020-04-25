import Foundation

struct LifeInitializer {
            
    func setInitialState(_ board : [Array<String>]) -> [Array<String>] {
        
        var newBoard = board

        for _ in 0...((newBoard.count * newBoard[0].count) / 2) - 1 {
            newBoard[Int.random(in: 0 ..< newBoard.count - 1)][Int.random(in: 0 ..< newBoard[0].count - 1)] = "#"
        }
               
        return newBoard
    }
    
    func getTotalAlives(_ board : [Array<String>]) -> Int {
        
        var total = 0
        board.forEach({total = total + $0.filter({$0 == "#"}).count})
        return total
    }
    
    
}
