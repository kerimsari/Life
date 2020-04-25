import Foundation

struct LifeRunner {
            
    func tick(_ board : [Array<String>]) -> ([Array<String>],Bool) {
                        
        var newBoard = Array.init(repeating: Array.init(repeating: " ", count: board.count), count: board.count)
                
        board.enumerated().forEach(
            {row in row.element.enumerated().forEach(
                {col in newBoard[row.offset][col.offset] = NextCellState(board, row.offset, col.offset)})})
                                                                
        return (newBoard, board == newBoard)
    }
    
    fileprivate func NextCellState(_ board: [[String]], _ rowIndex: Int, _ colIndex: Int) -> String {
        
        let liveNeighbours = liveNeighbourCount(board, rowIndex, colIndex)
        
        if board[rowIndex][colIndex] == "#" {
            return NextLiveCellState(liveNeighbours, rowIndex, colIndex)
        }
        else {
            return NextDeadCellState(liveNeighbours, rowIndex, colIndex)
        }
    }
    
    fileprivate func NextLiveCellState(_ liveNeighbours: Int, _ rowIndex: Int, _ colIndex: Int) -> String {
        if liveNeighbours < 2 || liveNeighbours > 3 {
            return " "
        }
        else {
            return "#"
        }
    }
    
    fileprivate func NextDeadCellState(_ liveNeighbours: Int, _ rowIndex: Int, _ colIndex: Int) -> String {
        if liveNeighbours == 3 {
            return "#"
        }
        else {
            return " "
        }
    }
    
    func liveNeighbourCount(_ board : [Array<String>],_ x : Int, _ y : Int) -> Int {
        var totalLiveNeighbours = 0
                
        totalLiveNeighbours += (y - 1 < 0 ? 0 : (board[x][y - 1] == "#" ? 1 : 0))
        totalLiveNeighbours += (y + 1 > board[x].count - 1 ? 0 : (board[x][y + 1] == "#" ? 1 : 0))
        totalLiveNeighbours += (y - 1 < 0 || x - 1 < 0 ? 0 : (board[x - 1][y - 1] == "#" ? 1 : 0))
        totalLiveNeighbours += (x - 1 < 0 ? 0 : (board[x - 1][y] == "#" ? 1 : 0))
        totalLiveNeighbours += (x - 1 < 0 || y + 1 > board[x].count - 1 ? 0 : (board[x - 1][y + 1] == "#" ? 1 : 0))
        totalLiveNeighbours += (y - 1 < 0 || x + 1 > board.count - 1 ? 0 : (board[x + 1][y - 1] == "#" ? 1 : 0))
        totalLiveNeighbours += (x + 1 > board.count - 1 ? 0 : (board[x + 1][y] == "#" ? 1 : 0))
        totalLiveNeighbours += (x + 1 > board.count - 1 || y + 1 > board[x].count - 1 ? 0 : (board[x + 1][y + 1] == "#" ? 1 : 0))
        
        return totalLiveNeighbours
    }
    
   
    
}
