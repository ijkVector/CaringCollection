//
//  ViewController.swift
//  CaringCollection
//
//  Created by Иван Дроботов on 27.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    private let _layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: _layout)
    
    private struct Constants {
        static let height = UIScreen.main.bounds.height*0.5
        static let width = UIScreen.main.bounds.width*0.7
    }
    
    private lazy var leftInset = collectionView.layoutMargins.left
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    private func style() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Collection"
        
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.description())
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func layout() {
        view.addSubview(collectionView)
        
        _layout.minimumLineSpacing = leftInset
        _layout.scrollDirection = .horizontal
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.frame = view.bounds
    }
}

//MARK: - CollectionView: Delegate and DataSourc
extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: Constants.width, height: Constants.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: leftInset*2, bottom: 0, right: leftInset*2)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCell.description(),
            for: indexPath) as? CustomCell else { return UICollectionViewCell() }
        
        return cell
    }
}

//MARK: - SclorrViewDelegate
extension ViewController: UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let offset = round((targetContentOffset.pointee.x - leftInset) / (Constants.width + leftInset))
        targetContentOffset.pointee.x = offset * (Constants.width + leftInset)
    }
}
