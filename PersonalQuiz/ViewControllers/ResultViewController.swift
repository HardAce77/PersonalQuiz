//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var backButton: UIBarButtonItem!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answersChoosen: [Answer]!
    
    private var resultAnswer: Animal!

    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.isHidden = true
        resultAnswer = getResult(answers: answersChoosen)
        titleLabel.text = "Вы - \(resultAnswer.rawValue)"
        definitionLabel.text = resultAnswer.definition
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func getResult(answers: [Answer]) -> Animal {
        var animals = [Animal]()
        for answer in answers {
            animals.append(answer.animal)
        }
        let animalSet = Dictionary(grouping: animals, by: {$0}).filter { $1.count > 1 }.keys
        return animalSet.randomElement() ?? Animal.dog
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
