//
//  ViewController.swift
//  DiceGame
//
//  Created by KPC-N-0036 on 6/20/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"),#imageLiteral(resourceName: "black2"),#imageLiteral(resourceName: "black3"),#imageLiteral(resourceName: "black4"),#imageLiteral(resourceName: "black5"),#imageLiteral(resourceName: "black6")]
    
    
    
    
    
    //앱의 화면에 들어오면 가장 먼저 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    
    

    @IBAction func rollButtonTapped(_ sender: UIButton) {
        
        //첫번째 이미지 뷰 랜덤으로 변경
        firstImageView.image = diceArray.randomElement()
        //두번째 이미지 뷰 랜덤으로 변경
        secondImageView.image = diceArray.randomElement()
        
    }
    


}

