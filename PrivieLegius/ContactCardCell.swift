//
//  ContactCardCell.swift
//  PrivieLegius
//
//  Created by raul.santos on 26/09/22.
//

import UIKit

class ContactCardCell: UITableViewCell {
    
    static let identifier = "ContatoCardTableViewCell"
    
//    var contact : Contact? {
//        didSet {
//            lastSeen.text = contact?.contactImage
//            profileName.text = contact?.contactName
//            messageTxt.text = contact?.contactDesc
//        }
//    }

    lazy var cardView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.17
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        return view
    }()
    
    lazy var profileImg: UIImageView = {
        let v = UIImageView()
        v.backgroundColor = .white
        v.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        v.layer.cornerRadius = v.bounds.height / 2
        v.clipsToBounds = true
        v.layer.borderWidth = 2
        v.layer.borderColor = UIColor.black.cgColor
        
        return v
    }()
    
    lazy var profileName: UILabel = {
        let lb = UILabel()
        lb.text = "Nome usuario"
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        lb.numberOfLines = 0
        lb.font = lb.font.withSize(14)
        return lb
    }()
    
    
    lazy var messageTxt: UILabel = {
        let lb = UILabel()
        lb.text = "New message from pikachu"
        lb.numberOfLines = 0
        lb.font = lb.font.withSize(14)
        lb.textColor = .gray
        return lb
    }()
    
    lazy var lastSeen: UILabel = {
        let lb = UILabel()
        lb.text = "23"
        lb.numberOfLines = 0
        lb.font = lb.font.withSize(14)
        lb.textColor = .black
        return lb
    }()
    
    lazy var borderTabView: UIView = {
        let v = UIView()
        v.backgroundColor = .gray
  
        return v
    }()
    
    lazy var topBorderTabView: UIView = {
        let v = UIView()
        v.backgroundColor = .gray

        return v
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(self.cardView)
        cardView.addSubview(profileImg)
        cardView.addSubview(profileName)
        cardView.addSubview(messageTxt)
        cardView.addSubview(lastSeen)
        cardView.addSubview(borderTabView)
        cardView.addSubview(topBorderTabView)
        
        borderTabView.snp.makeConstraints {
            $0.leading.bottom.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        topBorderTabView.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                cardView.topAnchor.constraint(equalTo: self.topAnchor),
                cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                cardView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                cardView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        
        profileImg.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                profileImg.heightAnchor.constraint(equalToConstant: 50),
                profileImg.widthAnchor.constraint(equalToConstant: 50),
                profileImg.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
                profileImg.topAnchor.constraint(equalTo: self.topAnchor,constant: 15),
                profileImg.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8)
        ])
        
        profileName.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                profileName.topAnchor.constraint(equalTo: self.topAnchor, constant: 17),
                profileName.leadingAnchor.constraint(equalTo: profileImg.trailingAnchor, constant: 8)
        ])
        
        messageTxt.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                messageTxt.topAnchor.constraint(equalTo: profileName.bottomAnchor,constant: 4),
                messageTxt.leadingAnchor.constraint(equalTo: profileImg.trailingAnchor, constant: 8)
        ])
        
        lastSeen.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                lastSeen.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
                lastSeen.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)
        ])
        
    }

}
