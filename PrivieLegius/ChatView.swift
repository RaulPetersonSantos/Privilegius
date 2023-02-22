//
//  ChatView.swift
//  PrivieLegius
//
//  Created by raul.santos on 18/09/22.
//

import Foundation
import UIKit
import SnapKit
class ChatView: BaseView {
    
    
    lazy var headerView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(named: "pinkColor")
        return v
    }()
    
    lazy var profileImg: UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "mistyIcon")
        v.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        v.layer.cornerRadius = v.bounds.height / 2
        v.clipsToBounds = true
        v.layer.borderWidth = 2
        v.layer.borderColor = UIColor.black.cgColor
        
        return v
    }()
    
    lazy var profileName: UILabel = {
        let lb = UILabel()
        //lb.text = "Nome usuario"
        lb.numberOfLines = 0
        lb.font = lb.font.withSize(24)
        lb.font = UIFont.boldSystemFont(ofSize: 24)
        
        return lb
    }()
    
    lazy var status: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(named: "green")
        v.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        v.layer.cornerRadius = v.bounds.height / 2
        v.clipsToBounds = true
        
        return v
    }()
    
    lazy var statusText: UILabel = {
        let lb = UILabel()
        lb.text = "Online"
        lb.numberOfLines = 0
        lb.font = lb.font.withSize(11)
        
        return lb
    }()
    
    lazy var settingsIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "setting")
        
        return img
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(ContactCardCell.self, forCellReuseIdentifier: ContactCardCell.identifier)
        tv.bounces = false
        tv.allowsSelection = false
        tv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 48, right: 0)
        tv.backgroundColor = .white
        return tv
    }()
    
    lazy var borderTabView: UIView = {
        let v = UIView()
        v.backgroundColor = .black
        v.layer.shadowColor = UIColor.gray.cgColor
        v.layer.shadowOpacity = 0.8
        v.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        return v
    }()
    
    lazy var stackBtns : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [btnAutorizar,btnRecusar])
        sv.distribution = .fillEqually
        sv.axis = .horizontal
        sv.spacing = 0.6
        sv.backgroundColor = .black
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var btnAutorizar : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.setTitleColor(.black, for: .normal)
        btn.setImage(UIImage(systemName: "message.fill"), for: .normal)
        return btn
    }()
    
    lazy var btnRecusar : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.setTitleColor(.black, for: .normal)
        btn.setImage(UIImage(systemName: "message.fill"), for: .normal)
        
        return btn
    }()
    

    lazy var bubbleNewMessage: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(named: "pinkColor")
        v.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        v.layer.cornerRadius = v.bounds.height / 2
        return v
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        self.setup()
        self.setupTableview()
        self.setupFooter()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        backgroundColor = .white
        addSubview(headerView)
        
        headerView.addSubview(profileImg)
        headerView.addSubview(profileName)
        headerView.addSubview(status)
        headerView.addSubview(statusText)
        headerView.addSubview(settingsIcon)
        
        
    btnRecusar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnRecusar.heightAnchor.constraint(equalToConstant: 50),
            btnRecusar.widthAnchor.constraint(equalToConstant: 50)
            
        ])
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: self.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 92)
        ])
        
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImg.heightAnchor.constraint(equalToConstant: 45),
            profileImg.widthAnchor.constraint(equalToConstant: 45),
            profileImg.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            profileImg.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8)
        ])
        
        profileName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileName.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            profileName.leadingAnchor.constraint(equalTo: profileImg.trailingAnchor, constant: 5)
        ])
        
        status.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            status.heightAnchor.constraint(equalToConstant: 10),
            status.widthAnchor.constraint(equalToConstant: 10),
            status.leadingAnchor.constraint(equalTo: profileImg.trailingAnchor, constant: 5),
            status.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 1)
        ])
        
        statusText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusText.leadingAnchor.constraint(equalTo: status.trailingAnchor, constant: 4),
            statusText.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 1)
        ])
        
        settingsIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingsIcon.heightAnchor.constraint(equalToConstant: 20),
            settingsIcon.widthAnchor.constraint(equalToConstant: 20),
            settingsIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -19),
            settingsIcon.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
        ])
        
    }
    
    private func setupTableview() {
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor,constant: 0),
        ])
        
    }
    
    private func setupFooter(){
        tableView.addSubview(stackBtns)
        stackBtns.addSubview(borderTabView)
        tableView.addSubview(bubbleNewMessage)
        
        
        stackBtns.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackBtns.heightAnchor.constraint(equalToConstant: 50),
            stackBtns.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackBtns.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackBtns.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        
        borderTabView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            borderTabView.heightAnchor.constraint(equalToConstant: 1),
            borderTabView.leadingAnchor.constraint(equalTo: stackBtns.leadingAnchor),
            borderTabView.trailingAnchor.constraint(equalTo: stackBtns.trailingAnchor),
            borderTabView.topAnchor.constraint(equalTo: stackBtns.topAnchor)
            
        ])
        
        
        bubbleNewMessage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bubbleNewMessage.bottomAnchor.constraint(equalTo: self.borderTabView.topAnchor,constant: -3),
            bubbleNewMessage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            bubbleNewMessage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24 ),
            bubbleNewMessage.heightAnchor.constraint(equalToConstant: 40),
            bubbleNewMessage.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}
