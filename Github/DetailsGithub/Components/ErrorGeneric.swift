//
//  ErrorView.swift
//  Github
//
//  Created by Pablo Rosalvo de Melo Lopes on 09/06/20.
//  Copyright © 2020 Pablo Rosalvo de Melo Lopes. All rights reserved.
//
import UIKit
import SnapKit

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
        viewController.view.addSubview(errorView)
        errorView.snp.makeConstraints { make in
            make.top.equalTo(viewController.view.snp.top)
            make.leading.equalTo(viewController.view.snp.leading)
            make.trailing.equalTo(viewController.view.snp.trailing)
            make.bottom.equalTo(viewController.view.snp.bottom)

        }
    }
}
