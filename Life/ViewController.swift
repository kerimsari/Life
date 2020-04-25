import UIKit

class ViewController: UIViewController {
                
    private var timer: Timer!
    private var runner : LifeRunner!
    
    private var gameData : [Array<String>]!
    private var gridView : GridView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        runner = LifeRunner()                
        
        setupBoard(width : 10)
        initGame(dimension : 10)
    }
    
    func setupBoard(width : Int) {
        self.view.backgroundColor = UIColor.blue
        gridView = GridView(frame: CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.width), boardWidth: width)
        self.view.addSubview(gridView)
    }
    
    func initGame(dimension : Int) {
        gameData = LifeInitializer().setInitialState(try! BoardMaker().makeBoard(dimension, dimension))
        self.loadBoard(gameData: gameData, gridView: gridView)
    }
            
    func loadBoard(gameData : [Array<String>],gridView : GridView) {
                        
        var cellColour : UIColor = .clear
        
        gameData.enumerated().forEach(
            {row in row.element.enumerated().forEach(
                {col in if(gameData[row.offset][col.offset]) == "#" {
                            cellColour = .black
                        }
                        else {
                            cellColour = UIColor(displayP3Red: 254/255, green: 222/255.0, blue: 169/255, alpha: 1)};
                            gridView.setCell(col.offset + 1, row.offset + 1, cellColour)
            })   })
    }
    
    @objc func tick() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
              DispatchQueue.main.async { [weak self] in
                let tempData = self!.runner.tick(self!.gameData)
                
                if !tempData.1 {
                    self!.gameData = tempData.0
                    self!.loadBoard(gameData: self!.gameData, gridView: self!.gridView)
                }
                else {
                    self!.timer.invalidate()
                }
            }
        }
    }
}

