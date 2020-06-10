//
//  DetailsGithubSpec.swift
//  GithubTests
//
//  Created by Pablo Rosalvo de Melo Lopes on 10/06/20.
//  Copyright © 2020 Pablo Rosalvo de Melo Lopes. All rights reserved.
//

import Nimble
import Nimble_Snapshots
import Quick

@testable import Github

final class DetailsGithubSpec: QuickSpec {
    override func spec() {
        describe( "DetailsGithubSpec")  {
            var sut: DetailsGithubViewController!
            var viewModel: DetailsGithubViewModel!
            
            context("when init viewController") {
                beforeEach {
                    viewModel = DetailsGithubViewModel(api: GithubDetailApiMock(shouldReturn: true))
                    sut = DetailsGithubViewController(viewModel: viewModel, navigation: UINavigationController())
                    sut.view.frame = CGRect(origin: .zero, size: CGSize(width: 320, height: 568))
                    WindowHelper.showInTestWindow(viewController: sut)
                    sut.beginAppearanceTransition(true, animated: false)
                    sut.endAppearanceTransition()
                }
                
                afterEach {
                    WindowHelper.cleanTestWindow()
                }
                
                it("should contain a valid layout") {
                    expect(sut).toEventually(haveValidSnapshot(), timeout: 2)
                }
                
                it("should contain 30 repositories") {
                    let numbersRepository = 30
                    expect(viewModel.modelDetails?.items?.count).to(equal(numbersRepository))
                }
            }
        }
    }
}
