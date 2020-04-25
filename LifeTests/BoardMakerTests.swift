import XCTest
import Life

class BoardMakerTests: XCTestCase {
    
    var sut : BoardMaker!
    
    override func setUp() {
        sut = BoardMaker()
    }
    
    func testCanNotMakeLessThanOneRowOneColumnBoard() {
        XCTAssertThrowsError(try sut.makeBoard(0, 0))
    }
    
    func testCanNotMakeLessThanTwoRowTwoColumnBoard() {
        XCTAssertThrowsError(try sut.makeBoard(1, 1))
    }
    
    func testCanNotMakeLessThanThreeRowThreeColumnBoard() {
        XCTAssertThrowsError(try sut.makeBoard(2, 2))
    }
    
    func testMakeBoardHeight() {
        XCTAssertEqual(try! sut.makeBoard(10,10).count, 10)
    }
    
    func testAlwaysLatestMadeBoardIsInCharge() {
        
        let _ = try! sut.makeBoard(10,10)
                        
        XCTAssertEqual(try! sut.makeBoard(4,4).count, 4)
    }
            
    func testPrintBoard() {
        let board = try! sut.makeBoard(5,5)
        
        BoardPrinter.print(board)
    }
    
    


}
