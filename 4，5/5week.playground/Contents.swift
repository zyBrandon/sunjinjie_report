//: Playground - noun: a place where people can play
import UIKit
import PlaygroundSupport
class TriangleView:UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.size.width/2, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))
        path.addLine(to: CGPoint(x: 0, y: rect.size.height))
        path.close()
        UIColor.green.setFill()
        path.fill()
    }
}

class Controller:UIViewController{
    var label:UILabel!
    var triangle:TriangleView!
    @IBAction func clicked() {
        print("I'm clicked!!")
        label?.text = "I'm clicked!!"
        UIView.animate(withDuration: 1){
            self.triangle.center = CGPoint(x: 200, y: 0)
        }
    }
    override func loadView() {
        view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 800))
        view.backgroundColor = UIColor.red
        
        label = UILabel(frame: CGRect(x: 100, y: 20, width: 200, height: 50))
        label.backgroundColor = UIColor.blue
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "Hello World!"
        view.addSubview(label)
        
        let url = URL(string:"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1734910358,1795775967&fm=27&gp=0.jpg")!
        
        let data = try!Data(contentsOf:url)
        let image = UIImage(data:data)
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: 400, height: 400))
        imageView.image = image
        view.addSubview(imageView)
        
        let button = UIButton(frame: CGRect(x: 100, y: 600, width: 200, height: 50))
        button.setTitle("click me!", for: .normal)
//        button.addTarget(self, action: #selector(Controller.clicked), for: UIControl.Event.touchUpInside)
        button.addTarget(self, action: #selector(Controller.clicked), for: UIControlEvents.touchUpInside)
        view.addSubview(button)
        
        triangle = TriangleView(frame: CGRect(x: 100, y: 400, width: 200, height: 200))
        triangle.backgroundColor = UIColor.clear
        view.addSubview(triangle)
    }
}
let ct = Controller()
PlaygroundPage.current.liveView = ct






