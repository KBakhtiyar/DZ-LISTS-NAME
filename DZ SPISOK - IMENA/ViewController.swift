//
//  ViewController.swift
//  DZ SPISOK - IMENA
//
//  Created by BK on 13.03.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let textField: UITextField = {
        let field = UITextField()
        field.borderStyle = .roundedRect
        return field
    }()
    let Label: UILabel = {
        let label = UILabel()
        label.text = "Lists name"
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Tap me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        view.backgroundColor = .magenta
        view.addSubview(textField)
        view.addSubview(Label)
        view.addSubview(button)
        
        setConstraints()
    }
    
    private func setConstraints() {
        textField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
            make.leading.trailing.equalToSuperview().inset(12)
        }
        Label.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(150)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(Label.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(12)
        }
    }
    
    @objc func buttonTapped() {
        guard let name = textField.text, !name.isEmpty else {
            print("Name is empty")
            return
        }
        
        UserDefaultsManager.shared.saveName(name)
        updateLabel()
        textField.text = ""
    }
    func updateLabel() {
        let names = UserDefaultsManager.shared.getNames()
        let namesString = names.joined(separator: "\n")
        Label.text = "Lists name:\n\(namesString)"
    }
  }
