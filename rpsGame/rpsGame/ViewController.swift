//
//  ViewController.swift
//  rpsGame
//
//  Created by KPC-N-0036 on 6/20/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLable: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLable: UILabel!
    
    @IBOutlet weak var myChoiceLable: UILabel!
    
    var myChoice: Rps = .rock
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    
    
    //UIViewController의 뷰가 메모리에 로드된 직후에 호출되는 메소드
    //한번만 호출됨 (뷰가 메모리에서 내려갔다 올라와도 viewDidLoad는 다시 호출되지 않음)
    //UI 초기화, 데이터 설정, 뷰구성등에 적절
    
    //생명 주기
    //init() → loadView() → viewDidLoad() → viewWillAppear() → viewDidAppear()
    
    
    //UI 요소 초기화(UILable, UIButton 등)
    //테이블 뷰/컬렉션 뷰 설정
    //네트워크 호출 시작
    //데이터 바인딩
    //서브뷰 추가 등
    
    //뷰가 화면에 나타나기 전이라 애니메이션이나 사용자와의 상호 작용은 보통 하지 않음.
    //뷰의 사이즈나 레이아웃 관련 작업은 viewDidLayoutSubviews 또는 viewWillLayoutSubviews 쪽이 더 적절할 수 있음
    override func viewDidLoad() {
        super.viewDidLoad()
        //1) 첫번째/두번째 이미지 뷰에 준비 (묵) 이미지를 띄워야함
        
        comImageView.image = #imageLiteral(resourceName: "rock")
        myImageView.image = #imageLiteral(resourceName: "ready")
        //2) 첫번째/두번째 레이블에 "준비"라고 띄워야함.
        comChoiceLable.text = "준비"
        myChoiceLable.text = "준비"
        
        
        
        
        
    }
    //함수 하나에 3개 연결함
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        //가위 바위 보를 선택해서 그 정보를 저장해야함.
        //현재 버튼에 표시 되고 있는 title을 알려줌..
     let title =  sender.currentTitle!
        
        switch title {
        case "가위" :
            myChoice = Rps.scissor
        case "바위" :
            myChoice = Rps.rock
        case "보" :
            myChoice = Rps.paper
        default : break
 
        }
     
        
        
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        switch comChoice {
        case .rock :
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLable.text = "바위"
        case .paper : 
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLable.text = "보"
        case .scissor : 
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLable.text = "가위"
        }
        switch myChoice {
        case .rock :
            myImageView.image = #imageLiteral(resourceName: "ready")
            myChoiceLable.text = "바위"
        case .paper :
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLable.text = "보"
        case .scissor :
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLable.text = "가위"
        }
        
        if myChoice == Rps.rock {
            if comChoice == Rps.paper {
                mainLable.text = "졌다"
            } else if comChoice == Rps.scissor {
                mainLable.text = "이겼다"
            } else {
                mainLable.text = "비겼다"
            }
        } else if myChoice == Rps.rock {
            if comChoice == Rps.paper {
                mainLable.text = "졌다"
            } else if comChoice == Rps.scissor {
                mainLable.text = "이겼다"
            } else {
                mainLable.text = "비겼다"
            }
        } else {
            if comChoice == Rps.paper {
                mainLable.text = "이겼다"
            } else if comChoice == Rps.scissor {
                mainLable.text = "비겼다"
            } else {
                mainLable.text = "졌다"
            }
        }
        
        
        
        
        
        //1) 컴퓨터가 랜덤 선택한 걸 이미지뷰에 표시
        //2) 컴퓨터 레이블에 표시
        //3) 내가 선택한거 이미지뷰 표시
        //4) 사용자 레이블에 표시
        //5) 결과 발표
        //select 버튼을 누르는 순가 기존에 선택된 정보를 컴퓨터 정보랑 비교해서 승리 여부를 결정해야함.
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        comImageView.image = #imageLiteral(resourceName: "rock")
        myImageView.image = #imageLiteral(resourceName: "rock")
        
        comChoiceLable.text = "준비"
        myChoiceLable.text = "준비"
        mainLable.text = "선택하세요"
        
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        
        //초기화
        //1) 컴퓨터 -> 준비상태로 이미지 뷰로 돌아감
        //2) 컴퓨터 -> 레이블 준비상태로 돌아감
        //3) 사용자 -> 준비상태로 이미지뷰 & 레이블 표시
        
    }
    
}
