//
//  ProfileTableViewCell.swift
//  students
//
//  Created by omair khan on 13/05/2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    // Configure cell Data
    var cellData : DataModel? {
        didSet {
            
            if let imageName = cellData?.imageName {
                profileImageView.image = UIImage(named: imageName)
            }
            
            if let name = cellData?.name {
                nameLabel.text = " Name: \(name)"
            }else{
                nameLabel.text = "No Name"
            }
            
            if let phone = cellData?.phone {
                phoneLabel.text = " Phone: \(phone)"
            }else{
                nameLabel.text = "No Phone"
            }
            
            if let email = cellData?.email {
                emailLabel.text = " Email: \(email)"
            }else{
                emailLabel.text = "No Email"
            }
        }
    }
    
    /**
     - Profile ImageView
     - Name Label
     - Email Label
     - Phone label
     - View for Labels
     */
    
    let profileImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8.0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let nameLabel : UILabel = {
        var lbl = UILabel()
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let emailLabel : UILabel = {
        var lbl = UILabel()
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        lbl.font = .systemFont(ofSize: 14, weight: .light)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let phoneLabel : UILabel = {
        var lbl = UILabel()
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        lbl.font = .systemFont(ofSize: 14, weight: .light)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let viewForLabels : UIView = {
        var view = UIView()
        view.clipsToBounds = true
        view.contentMode = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        setUpView()
    }

    
    func setUpView() {
        /**
         - Add Subviews
         - Add Constraints
         */
        self.contentView.addSubview(profileImageView)
        self.addSubview(viewForLabels)
        self.viewForLabels.addSubview(nameLabel)
        self.viewForLabels.addSubview(emailLabel)
        self.viewForLabels.addSubview(phoneLabel)
        
        let constraints = [
            // View For labels
            viewForLabels.leadingAnchor.constraint(equalTo: self.profileImageView.trailingAnchor, constant: 2),
            viewForLabels.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            viewForLabels.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
            viewForLabels.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -2),
            
            
            // profileImageView
            profileImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 2),
            profileImageView.trailingAnchor.constraint(equalTo: self.viewForLabels.leadingAnchor, constant: 1),
            profileImageView.widthAnchor.constraint(equalToConstant: self.contentView.frame.size.width/3),
            profileImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 2),
            profileImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -2),
            
        
            // Name label
            nameLabel.leadingAnchor.constraint(equalTo: self.viewForLabels.leadingAnchor, constant: 1),
            nameLabel.trailingAnchor.constraint(equalTo: self.viewForLabels.trailingAnchor, constant: 2),
            nameLabel.topAnchor.constraint(equalTo: self.viewForLabels.topAnchor, constant: 2),
            nameLabel.heightAnchor.constraint(equalToConstant: self.contentView.frame.height/3),
            
            // Email Label
            emailLabel.leadingAnchor.constraint(equalTo: self.viewForLabels.leadingAnchor, constant: 2),
            emailLabel.trailingAnchor.constraint(equalTo: self.viewForLabels.trailingAnchor, constant: 2),
            emailLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 8),
            emailLabel.bottomAnchor.constraint(equalTo: self.phoneLabel.topAnchor, constant: -4),
            
            // Phone Label
            phoneLabel.leadingAnchor.constraint(equalTo: self.viewForLabels.leadingAnchor, constant: 2),
            phoneLabel.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 4),
            phoneLabel.heightAnchor.constraint(equalToConstant: self.contentView.frame.width/12),
           
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
