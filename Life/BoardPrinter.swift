import Foundation

struct BoardPrinter {
    
    static func print(_ board : [Array<String>]) {
        for row in board {
            Swift.print(row)
        }
    }
}
