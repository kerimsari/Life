import UIKit

class GridView: UIView {
           
    var boardSize : CGFloat!
    var cellCount : Int!
    var cellSize : CGFloat!
    
    var path = UIBezierPath()
    
    public convenience init(frame : CGRect,boardWidth : Int) {
        self.init(frame: frame)
                
        self.boardSize = min(frame.size.width, frame.size.height)
        self.cellCount = boardWidth + 2
        self.cellSize = boardSize / CGFloat(cellCount)
        self.backgroundColor = UIColor(displayP3Red: 254/255, green: 222/255.0, blue: 169/255, alpha: 1)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func squarePathWithCenter(center: CGPoint, side: CGFloat) -> UIBezierPath {
        
        let squarePath = UIBezierPath()
        
        let startX = center.x - side / 2
        let startY = center.y - side / 2
                
        squarePath.move(to: CGPoint(x: startX, y: startY))

        squarePath.addLine(to: squarePath.currentPoint)
        squarePath.addLine(to: CGPoint(x: startX + side, y: startY))
        squarePath.addLine(to: squarePath.currentPoint)
        squarePath.addLine(to: CGPoint(x: startX + side, y: startY + side))
        squarePath.addLine(to: squarePath.currentPoint)
        squarePath.addLine(to: CGPoint(x: startX, y: startY + side))
        squarePath.addLine(to: squarePath.currentPoint)
                
        squarePath.close()
        return squarePath
    }
    
    func setCell(_ row : Int, _ col : Int, _ color : UIColor) {
        
        let xPos = CGFloat(row) * cellSize
        let yPos = CGFloat(col) * cellSize
        
        color.setFill()
        
        path = squarePathWithCenter(center: CGPoint(x: xPos + (cellSize / 2) , y: yPos + (cellSize / 2)), side: (cellSize * 9) / 10)
        
        let fillLayer = CAShapeLayer()
        
        fillLayer.path = path.cgPath
        fillLayer.fillColor = color.cgColor
        
        self.layer.addSublayer(fillLayer)        
        path.stroke()
                        
        self.setNeedsLayout()
    }
            
    override func draw(_ rect: CGRect) {
                
        for i in 1..<cellCount {
            let xPos = CGFloat(i) * cellSize
            path.move(to: CGPoint(x: xPos, y: cellSize))
            path.addLine(to: CGPoint(x: xPos, y: self.boardSize - cellSize))
        }
        
        for i in 1..<cellCount {
            let yPos = CGFloat(i) * cellSize
            path.move(to: CGPoint(x: cellSize, y: yPos))
            path.addLine(to: CGPoint(x: self.boardSize - cellSize, y: yPos))
        }
        
        path.lineWidth = 1
        path.stroke()
    }
}



