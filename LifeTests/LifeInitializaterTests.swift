import XCTest
import Life

class LifeInitializaterTests: XCTestCase {

    var sut : LifeInitializer!
    
    override func setUp() {
        sut = LifeInitializer()
    }
    
    func testGenerate_InitialState_Minimum_HalfOfCellsAlive() {
        
        let width = 8; let height = 8
        let board = try! BoardMaker().makeBoard(width, height)
        
        let _ = sut.setInitialState(board)
        
        XCTAssertTrue(sut.getTotalAlives(board) < (width * height) / 2)
    }
    
    func testGenerate_InitialState_Minimum_HalfOfCellsAlive_1() {
        
        let width = 10; let height = 10
        let board = try! BoardMaker().makeBoard(width, height)
        
        let _ = sut.setInitialState(board)
        
        XCTAssertTrue(sut.getTotalAlives(board) < (width * height) / 2)
    }
    
    func testGenerate_InitialState_Minimum_HalfOfCellsAlive_2() {
        
        let width = 5; let height = 5
        let board = try! BoardMaker().makeBoard(width, height)
        
        let _ = sut.setInitialState(board)
        
        XCTAssertTrue(sut.getTotalAlives(board) < (width * height) / 2)
    }
    
    func testGenerate_InitialState_Minimum_HalfOfCellsAlive_3() {
        
        let width = 5; let height = 7
        let board = try! BoardMaker().makeBoard(width, height)
        
        let _ = sut.setInitialState(board)
        
        XCTAssertTrue(sut.getTotalAlives(board) < (width * height) / 2)
    }
    
    func testPrint1() {
        
        BoardPrinter.print(sut.setInitialState(try! BoardMaker().makeBoard(4, 4)))
    }
    
    func testPrint2() {
        
        BoardPrinter.print(sut.setInitialState(try! BoardMaker().makeBoard(4, 4)))
    }
    
    func testPrint3() {
        
        BoardPrinter.print(sut.setInitialState(try! BoardMaker().makeBoard(4, 4)))
    }
}
