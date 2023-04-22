import UIKit

class ViewController: UIViewController {
    
    let ball: UIView = UIView()
    let areaForBall: UIView = UIView()
    
    var xBall = 0
    var yBall = 0
    
    let wightBall = 100
    let heightBall = 100
    
    let step = 25
    
    let widgthBtn = 80.0
    let heightBtn = 35.0
    
    let upBallBtn: UIButton = UIButton()
    let downBallBtn: UIButton = UIButton()
    let leftBallBtn: UIButton = UIButton()
    let rightBallBtn: UIButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .randomColor()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let widthArea = view.bounds.width
        let heightArea = view.bounds.height - (heightBtn * 5)
        
        areaForBall.frame = CGRect(x: 0, y: 0, width: widthArea, height: heightArea)
        areaForBall.backgroundColor = .randomColor()
        view.addSubview(areaForBall)
        
        xBall = (Int(areaForBall.bounds.width) / 2) - (wightBall / 2)
        yBall = (Int(areaForBall.bounds.height) / 2) - (heightBall / 2)
        
        ball.frame = CGRect(x: xBall, y: yBall, width: wightBall, height: heightBall)
        ball.backgroundColor = .black
        ball.layer.cornerRadius = ball.bounds.height / 2
        
        areaForBall.addSubview(ball)
        
        let xUpBtn = Double(view.bounds.width) / 2 - (widgthBtn / 2)
        let yUpBtn = view.bounds.height - (heightBtn * 4) - 30
                      
        upBallBtn.frame = CGRect(x: xUpBtn, y: yUpBtn, width: widgthBtn, height: heightBtn)
        prepareButton(upBallBtn)
        upBallBtn.addTarget(self, action: #selector(moveUp), for: .touchUpInside)
        upBallBtn.setTitle("UP", for: .normal)
        
        view.addSubview(upBallBtn)
        
        
        let xLeftBtn = upBallBtn.frame.origin.x - widgthBtn - 16
        let yLeftBtn = upBallBtn.frame.origin.y + upBallBtn.frame.size.height
                      
        leftBallBtn.frame = CGRect(x: xLeftBtn,
                                   y: yLeftBtn,
                                   width: widgthBtn,
                                   height: heightBtn)
        prepareButton(leftBallBtn)
        leftBallBtn.addTarget(self, action: #selector(moveLeft), for: .touchUpInside)
        leftBallBtn.setTitle("LEFT", for: .normal)
        
        view.addSubview(leftBallBtn)
        
        
        
        let xRightBtn = upBallBtn.frame.origin.x + upBallBtn.frame.size.width + 16
        let yRightBtn = upBallBtn.frame.origin.y + upBallBtn.frame.size.height
                      
        rightBallBtn.frame = CGRect(x: xRightBtn,
                                    y: yRightBtn,
                                    width: CGFloat(widgthBtn),
                                    height: CGFloat(heightBtn))
        prepareButton(rightBallBtn)
        rightBallBtn.addTarget(self, action: #selector(moveRight), for: .touchUpInside)
        rightBallBtn.setTitle("RIGHT", for: .normal)
        
        view.addSubview(rightBallBtn)
        
        
        
        let xDownBtn = rightBallBtn.frame.origin.x - rightBallBtn.frame.size.width - 16
        let yDownBtn = rightBallBtn.frame.origin.y + rightBallBtn.frame.size.height
                      
        downBallBtn.frame = CGRect(x: xDownBtn,
                                   y: yDownBtn,
                                   width: widgthBtn,
                                   height: heightBtn)
        prepareButton(downBallBtn)
        downBallBtn.addTarget(self,
                              action: #selector(moveDown),
                              for: .touchUpInside)
        downBallBtn.setTitle("DOWN", for: .normal)
        
        view.addSubview(downBallBtn)
    }
    
    func prepareButton(_ button: UIButton) {
        button.backgroundColor = .red
        button.layer.cornerRadius = heightBtn / 2
    }
    
    @objc func moveUp() {
        if yBall > (Int(areaForBall.frame.minY) + step) {
            yBall -= step
        }
        ball.frame = CGRect(x: xBall, y: yBall, width: wightBall, height: heightBall)
    }
    
    @objc func moveDown() {
        if yBall < ((Int(areaForBall.frame.maxY) - heightBall) - step) {
            yBall += step
        }
        ball.frame = CGRect(x: xBall, y: yBall, width: wightBall, height: heightBall)
    }
    
    @objc func moveLeft() {
        if xBall > (Int(areaForBall.frame.minX) + step) {
            xBall -= step
        }
        ball.frame = CGRect(x: xBall, y: yBall, width: wightBall, height: heightBall)
    }
    
    @objc func moveRight() {
        if xBall < ((Int(areaForBall.frame.maxX) - heightBall) - step) {
            xBall += step
        }
        ball.frame = CGRect(x: xBall, y: yBall, width: wightBall, height: heightBall)
    
    }
}



