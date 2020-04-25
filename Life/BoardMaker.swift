struct BoardMaker {
                        
    func makeBoard(_ width : Int, _ height : Int) throws -> [Array<String>] {
        
        if (width < 3 || height < 3) {
            throw BoardMakerError.Overflow
        }                                                      
        return Array.init(repeating: Array.init(repeating: " ", count: width), count: height)
    }
}

public enum BoardMakerError : Error {
    case Overflow
}
