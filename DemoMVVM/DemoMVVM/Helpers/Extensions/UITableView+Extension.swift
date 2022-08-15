//
//  UITableViewExtension.swift
//  CodingDemo
//
//  Created by Vijay Yadav on 13/04/21.
//

import UIKit


extension UITableView {
    
    ///Registers the given cell
    func registerClass(cellType:UITableViewCell.Type) {
        register(cellType, forCellReuseIdentifier: cellType.defaultReuseIdentifier)
    }
    
    ///Register Table View Cell Nib
    func registerCell(with identifier: UITableViewCell.Type)  {
        self.register(UINib(nibName: "\(identifier.self)",bundle:nil),
                      forCellReuseIdentifier: "\(identifier.self)")
    }
        
    ///Dequeue Table View Cell
    func dequeueCell <T: UITableViewCell> (with identifier: T.Type, indexPath: IndexPath? = nil) -> T {
        if let index = indexPath {
            return self.dequeueReusableCell(withIdentifier: "\(identifier.self)", for: index) as! T
        } else {
            return self.dequeueReusableCell(withIdentifier: "\(identifier.self)") as! T
        }
    }
    
    func showActivityForPagination(isHidden: Bool){
        
        let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        spinner.color = .yellow
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.bounds.width, height: CGFloat(50))
        self.tableFooterView = spinner
        self.tableFooterView?.isHidden = isHidden
    }
}

extension UITableViewCell {
    public static var defaultReuseIdentifier: String {
        return "\(self)"
    }
}

