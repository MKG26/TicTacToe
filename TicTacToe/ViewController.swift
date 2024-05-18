//
//  ViewController.swift
//  TicTacToe
//
//  Created by Mohit Kumar Gupta on 18/05/24.
//

import UIKit

class ViewController: UIViewController {

    enum Turn{
        case Cross
        case Circle
    }
    
    @IBOutlet var turnLabel: UILabel!
    @IBOutlet var a1: UIButton!
    @IBOutlet var a2: UIButton!
    @IBOutlet var a3: UIButton!
    @IBOutlet var b1: UIButton!
    @IBOutlet var b2: UIButton!
    @IBOutlet var b3: UIButton!
    @IBOutlet var c1: UIButton!
    @IBOutlet var c2: UIButton!
    @IBOutlet var c3: UIButton!
    
    var crossScore = 0
    var circleScore = 0
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    
    var CIRCLE = "O"
    var CROSS = "X"
    var board = [UIButton]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        
        initBoard()
        
        for button in board{
            button.setTitle(".", for: .normal)
        }
    }
    
    func initBoard(){
        
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }
    

    @IBAction func boardTapAction(_ sender: UIButton) {
        
        addToBoard(sender)
        
        if checkForVictory(CROSS){
            
            crossScore += 1
            resultAlert(title: "X Wins!")
        }
        
        if checkForVictory(CIRCLE){
            
            circleScore += 1
            resultAlert(title: "O Wins!")
        }
        
        if(fullBoard()){
            
            resultAlert(title: "Draw")
        }
    }
    
    func checkForVictory(_ s: String ) -> Bool{
        
        // horizontal
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s){
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s){
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s){
            return true
        }
        
        //vertical
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s){
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s){
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s){
            return true
        }
        
        //Diagonal
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s){
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s){
            return true
        }
        
        
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool{
        
        return button.title(for: .normal) == symbol
    }
    
    
    func resultAlert(title: String){
        
        let message = "\nCircles " + String(circleScore) + "\n\nCrosses " + String(crossScore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.resetBoard()
        }))
        
        self.present(ac, animated: true)
        
    }
    
    func resetBoard(){
        
        for button in board{
            
            button.setTitle(".", for: .normal)
            button.isEnabled = true
        }
        
//        if firstTurn == Turn.Circle{
//            
//            firstTurn = Turn.Cross
//            turnLabel.text = CROSS
//        }
//        else if firstTurn == Turn.Cross{
//            
//            firstTurn = Turn.Circle
//            turnLabel.text = CIRCLE
//        }
//        
//        currentTurn = firstTurn
    }
    
    func fullBoard() -> Bool{
        
        for button in board{
            
            if (button.title(for: .normal) == "."){
                
                return false
            }
        }
        
        return true
    }
    
    
    func addToBoard(_ sender: UIButton){
        
        
        
        if(sender.title(for: .normal) == "."){
            
            
            if(currentTurn == Turn.Circle){
                
                sender.setTitle(CIRCLE, for: .normal)
                sender.titleLabel?.textColor = .blue
                currentTurn = Turn.Cross
                turnLabel.text = CROSS
                
            }
            else if(currentTurn == Turn.Cross){
                
                sender.setTitle(CROSS, for: .normal)
                sender.titleLabel?.textColor = .blue
                currentTurn = Turn.Circle
                turnLabel.text = CIRCLE
            }
            
        }
    }
    

}

