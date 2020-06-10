//
//  ErrorViewSpec.swift
//  GithubTests
//
//  Created by Pablo Rosalvo de Melo Lopes on 10/06/20.
//  Copyright © 2020 Pablo Rosalvo de Melo Lopes. All rights reserved.
//

import Nimble
import Nimble_Snapshots
import Quick

@testable import Github

final class ErrorViewSpec: QuickSpec {
    override func spec() {
        describe( "DetailsGithubSpec")  {
            var sut: ErrorViewGeneric!
            
            context("when init viewController") {
                
                beforeEach {
                    sut = ErrorViewGeneric()
                    sut.frame = CGRect(origin: .zero, size: CGSize(width: 320, height: 600))
                }
                
                afterEach {
                    WindowHelper.cleanTestWindow()
                }
                
                it("should contain a valid layout") {
                    expect(sut).toEventually(haveValidSnapshot(), timeout: 3)
                }
            }
        }
    }
}

