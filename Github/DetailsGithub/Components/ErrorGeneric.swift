//
//  ErrorView.swift
//  Github
//
//  Created by Pablo Rosalvo de Melo Lopes on 09/06/20.
//  Copyright © 2020 Pablo Rosalvo de Melo Lopes. All rights reserved.
//
import UIKit

public extension UIViewController {
    var ds: ErrorGeneric {
        return ErrorGeneric(self)
    }
}

public class ErrorGeneric {
    
    let viewController: UIViewController
    
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    public func showError(reload: (() -> Void)? = nil) {
        let errorView = ErrorViewGeneric()
        errorView.reloadAction = reload
        errorView.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(errorView)
        
        NSLayoutConstraint.activate([errorView.topAnchor.constraint(equalTo: viewController.view.layoutMarginsGuide.topAnchor),
                                     errorView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
                                     errorView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
                                     errorView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor)])
    }
}
