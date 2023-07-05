//
//  OnboardingPresenterTests.swift
//  FitnestXTests
//
//  Created by Trung Nguyen on 05/07/2023.
//

import XCTest
@testable import FitnestX

final class OnboardingPresenterTests: XCTestCase {

  var presenter: OnboardingPresenter!
  var viewMock: OnboardingViewMock!
  var routerMock: OnboardingRouterMock!

  override func setUp() {
    super.setUp()
    viewMock = OnboardingViewMock()
    routerMock = OnboardingRouterMock(view: OnboardingViewController())
    presenter = OnboardingPresenter(view: viewMock, router: routerMock)
  }

  override func tearDown() {
    presenter = nil
    viewMock = nil
    routerMock = nil
    super.tearDown()
  }

  func testNextButtonDidTap_IncrementCurrentIndex() {
    // Arrange
    presenter.currentIndex = 0
    
    // Act
    presenter.onNextButtonDidTap()
    
    // Assert
    XCTAssertEqual(presenter.currentIndex, 1)
  }
  
  func testNextButtonDidTap_ScrollToNextItem() {
    // Arrange
    presenter.currentIndex = 0
    
    // Act
    presenter.onNextButtonDidTap()
    
    // Assert
    XCTAssertTrue(viewMock.didScrollToItem)
    XCTAssertEqual(viewMock.lastTargetIndex, 1)
  }
  
  func testNextButtonDidTap_UpdateProgressRingView() {
    // Arrange
    presenter.currentIndex = 0
    
    // Act
    presenter.onNextButtonDidTap()
    
    // Assert
    XCTAssertTrue(viewMock.didSetProgressRingView)
    XCTAssertEqual(viewMock.lastProgress, 0.5)
  }
  
  func testNextButtonDidTap_NavigateToLoginScreenOnLastItem() {
    // Arrange
    presenter.currentIndex = OnboardingBuilder.onboardingViewModels.count - 1
    
    // Act
    presenter.onNextButtonDidTap()
    
    // Assert
    XCTAssertTrue(routerMock.didNavigateToLoginScreen)
  }
  
  func testMoveToItem_UpdateCurrentIndex() {
    // Act
    presenter.onMoveToItem(at: 2)
    
    // Assert
    XCTAssertEqual(presenter.currentIndex, 2)
  }
  
  func testMoveToItem_UpdateProgressRingView() {
    // Act
    presenter.onMoveToItem(at: 1)
    
    // Assert
    XCTAssertTrue(viewMock.didSetProgressRingView)
    XCTAssertEqual(viewMock.lastProgress, 0.5)
  }
}

// Mock Classes

final class OnboardingViewMock: OnboardingViewProtocol {
  var didScrollToItem = false
  var lastTargetIndex: Int?
  var didSetProgressRingView = false
  var lastProgress: Float?
  
  func scrollToItem(at index: Int) {
    didScrollToItem = true
    lastTargetIndex = index
  }
  
  func setProgressRingView(_ progress: Float) {
    didSetProgressRingView = true
    lastProgress = progress
  }
}

final class OnboardingRouterMock: OnboardingRouterProtocol {
  required init(view: FitnestX.OnboardingViewController) {
    
  }
  
  var didNavigateToLoginScreen = false
  
  func navigateToLoginScreen() {
    didNavigateToLoginScreen = true
  }
}
