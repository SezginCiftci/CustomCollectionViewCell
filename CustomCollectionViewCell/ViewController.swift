//
//  ViewController.swift
//  CustomCollectionViewCell
//
//  Created by Sezgin Çiftci on 28.12.2021.
//

import UIKit

struct CustomData {
    var title: String
    var image: UIImage
    var url: String
}

class ViewController: UIViewController {
    
    fileprivate var data = [
        
        CustomData(title: "empire state", image: UIImage(named: "image 1")!, url: "mockurl.com"),
        CustomData(title: "window", image: UIImage(named: "image 2")!, url: "mockurl.com"),
        CustomData(title: "old men", image: UIImage(named: "image 3")!, url: "mockurl.com"),
        CustomData(title: "buildings", image: UIImage(named: "image 4")!, url: "mockurl.com"),
        CustomData(title: "walking stairs", image: UIImage(named: "image 5")!, url: "mockurl.com")

    ]
    
    fileprivate var customCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        
       return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Custom Collection"
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(customCollection)
        customCollection.backgroundColor = .white
        customCollection.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 8).isActive = true
        customCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        customCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        customCollection.heightAnchor.constraint(equalTo: customCollection.widthAnchor, multiplier: 0.5).isActive = true

        customCollection.delegate = self
        customCollection.dataSource = self
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.row]
        return cell
    }
    
}

class CustomCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.image
        }
    }
    
    
    fileprivate var bg: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


