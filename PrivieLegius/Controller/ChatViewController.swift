//
//  ChatViewController.swift
//  PrivieLegius
//
//  Created by raul.santos on 18/09/22.
//

import UIKit
import RxSwift
import RxCocoa
import FirebaseDatabase
import Firebase



protocol ChatViewControllerProtocol {
    
    var nomeDoUsuario: Observable<String> { get }
    
}

class ChatViewController : BaseViewController <ChatView>, UIScrollViewDelegate{
    
    var viewModel: ChatViewControllerProtocol {
        return baseViewModel as! ChatViewControllerProtocol
    }
    
    var chatModels = [ChatModel]()
    
    var teste : LoginProtocol?
    
    var contact : [Contact] = [Contact]()
    
    var userDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        customView.tableView.dataSource = self
        customView.tableView.delegate = self
        creatContactArray()
        self.customView.tableView.register(ContactCardCell.self,
                                           forCellReuseIdentifier: ContactCardCell.identifier)
        
        
        bind()
        
        let backButtonImage = UIImage(named: "back-button")
        if let backButtonImage = backButtonImage {
            addButtonOnNavigationBar(content: .image(image: backButtonImage), position: .right) { [weak self] in
                guard let self = self else { return }
                self.dismiss()
            }
        }
    }
    
    func bind() {
        
        disposeBag = DisposeBag()
        
        self.viewModel.nomeDoUsuario.subscribe(onNext: { value in
            self.customView.profileName.text = value
        }).disposed(by: disposeBag)
        
    }
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
//
//    func getName() {
//        var userDefaults = UserDefaults.standard
//        let nameOficial : String = "\(userDefaults.string(forKey: "userNameKey")!)"
//        self.customView.profileName.text = nameOficial
//    }
    
    
    
    private var cellHeight: CGFloat = 0
    
    private func setCellHeight(rowHeight: CGFloat) {
        self.cellHeight = rowHeight
        customView.tableView.reloadData()
    }
    
    func creatContactArray(){
        contact.append(Contact(contactName: "Brock", contactImage: "charmanderIcon", contactDesc: "Eae tudo bom?"))
        contact.append(Contact(contactName: "Ash", contactImage: "pikachuIcon", contactDesc: "Tudo certo"))
    }
    
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContatoCardTableViewCell", for: indexPath) as! ContactCardCell
        let model = self.contact[indexPath.row]
        cell.profileImg.image = UIImage(named: model.contactImage)
        cell.profileName.text = model.contactName
        cell.messageTxt.text = model.contactDesc

        return cell
    }
    
}

struct Contact {
    var contactName : String
    var contactImage : String
    var contactDesc : String
}


