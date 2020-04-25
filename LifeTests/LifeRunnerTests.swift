import XCTest

class LifeRunnerTests: XCTestCase {

    var sut : LifeRunner!
    
    override func setUp() {
        sut = LifeRunner()
    }
        
    func testUnderPopulationFirstCell() {
        let board = [["#"," "," "],
                     [" "," "," "],
                     [" "," "," "]]
        
        XCTAssertEqual(sut.tick(board).0,[[" "," "," "],
                                        [" "," "," "],
                                        [" "," "," "]])
                
    }
    
    func testUnderPopulationFirstSecondCell() {
        let board = [["#","#"," "],
                     [" "," "," "],
                     [" "," "," "]]
        
        XCTAssertEqual(sut.tick(board).0,[[" "," "," "],
                                        [" "," "," "],
                                        [" "," "," "]])
                
    }
    
    func testReproductionNextGeneration() {
        let board = [["#","#","#"],
                     [" "," "," "],
                     [" "," "," "]]
        
        XCTAssertEqual(sut.tick(board).0,[[" ","#"," "],
                                        [" ","#"," "],
                                        [" "," "," "]])
                
    }
    
    func testUnderPopulationFirstSecondCellColumn() {
        let board = [[" ","#"," "],
                     [" ","#"," "],
                     [" "," "," "]]

        XCTAssertEqual(sut.tick(board).0,[[" "," "," "],
                                        [" "," "," "],
                                        [" "," "," "]])
                   
    }
    
    func testReproductionNextGenerationVertical() {
        let board = [[" ","#"," "],
                     [" ","#"," "],
                     [" ","#"," "]]

        XCTAssertEqual(sut.tick(board).0,[[" "," "," "],
                                        ["#","#","#"],
                                        [" "," "," "]])
                      
    }
    
    
    func testReproductionOverPopulation() {
        let board = [[" ","#"," "],
                     ["#","#","#"],
                     [" ","#"," "]]

        XCTAssertEqual(sut.tick(board).0,[["#","#","#"],
                                        ["#"," ","#"],
                                        ["#","#","#"]])
                      
    }
    
    func testReproductionNextGenerationLeftUpperCorner() {
        let board = [[" ","#"," "],
                     ["#","#"," "],
                     [" "," "," "]]

        XCTAssertEqual(sut.tick(board).0,[["#","#"," "],
                                        ["#","#"," "],
                                        [" "," "," "]])
                      
    }
    
    func testReproductionNextGenerationLeft() {
        let board = [["#","#"," "],
                     ["#"," "," "],
                     [" "," "," "]]

        XCTAssertEqual(sut.tick(board).0,[["#","#"," "],
                                        ["#","#"," "],
                                        [" "," "," "]])
                      
    }
    
    func testBlock() {
        let board = [[" "," "," "," "],
                     [" ","#","#"," "],
                     [" ","#","#"," "],
                     [" "," "," "," "]]

        XCTAssertEqual(sut.tick(board).1,true)
                      
    }
    
    func testBeehive() {
        let board = [[" "," "," "," "," "," "],
                     [" "," ","#","#"," "," "],
                     [" ","#"," "," ","#"," "],
                     [" "," ","#","#"," "," "],
                     [" "," "," "," "," "," "],
                     [" "," "," "," "," "," "]]

        XCTAssertEqual(sut.tick(board).1,true)
                      
    }
    
    func testOscillators() {
        let board = [[" "," "," "," "," "],
                     [" "," ","#"," "," "],
                     [" "," ","#"," "," "],
                     [" "," ","#"," "," "],
                     [" "," "," "," "," "],
                     [" "," "," "," "," "]]

        XCTAssertEqual(sut.tick(board).1,false)
                      
    }
    
    func testLoaf() {
        let board = [[" "," "," "," "," "," "],
                     [" "," ","#","#"," "," "],
                     [" ","#"," "," ","#"," "],
                     [" "," ","#"," ","#"," "],
                     [" "," "," ","#"," "," "],
                     [" "," "," "," "," "," "]]

        XCTAssertEqual(sut.tick(board).1,true)
    }
    
    
    func testPrintTest() {
        let board = LifeInitializer().setInitialState(try! BoardMaker().makeBoard(10, 10))
        
        BoardPrinter.print(board)
        print("\n")
        BoardPrinter.print(sut.tick(board).0)
        print("\n")
        BoardPrinter.print(sut.tick(board).0)
        print("\n")
        BoardPrinter.print(sut.tick(board).0)
    }
    
    

}

