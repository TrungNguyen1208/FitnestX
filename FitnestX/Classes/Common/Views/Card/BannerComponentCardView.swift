//
//  BannerComponentCardView.swift
//  FitnestX
//
//  Created by Tiến Ngô on 18/06/2023.
//

import UIKit
import Foundation

enum TypeBanner {
    case typeBMI
    case typeTimeSleep
    case typeCalender
    case typeIdealHour
}

final class BannerComponentCardView: NibView {
    
    // MARK: - Outlet
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var lbTitleButton: UILabel!
    @IBOutlet weak var imgRightBanner: UIImageView!
    @IBOutlet weak var lbDescriptionBanner: UILabel!
    @IBOutlet weak var lbTitleBanner: UILabel!
    @IBOutlet weak var buttonView: GradientButton!
    @IBOutlet weak var imgBackgroundBanner: UIImageView!
    
    // MARK: - Property
    
    private var typeBanner: TypeBanner = .typeBMI {
        didSet {
            switch typeBanner {
            case .typeBMI:
                
                lbTitleBanner.font = R.font.poppinsSemiBold(size: 14)
                lbTitleBanner.textColor = .white
                lbDescriptionBanner.font = R.font.poppinsRegular(size: 12)
                lbDescriptionBanner.textColor = .white
                
                buttonView.startColor = R.color.purpleEEA4CE()!
                buttonView.endColor = R.color.purpleC58BF2()!
                
                lbTitleButton.font = R.font.poppinsSemiBold(size: 10)
                lbTitleButton.textColor = .white
                lbTitleButton.text = "View More"
            case .typeTimeSleep:
                
                lbTitleBanner.font = R.font.poppinsMedium(size: 14)
                lbTitleBanner.textColor = .white
                lbDescriptionBanner.font = R.font.poppinsMedium(size: 14)
                lbDescriptionBanner.textColor = .white
                
                buttonView.isHidden = true
                imgRightBanner.isHidden = true
            case .typeCalender:
                
                lbTitleBanner.font = R.font.poppinsMedium(size: 12)
                lbTitleBanner.textColor = .black
                lbDescriptionBanner.isHidden = true
                
                buttonView.startColor = R.color.blue9DCEFF()!
                buttonView.endColor = R.color.blue92A3FD()!
                
                lbTitleButton.font = R.font.poppinsSemiBold(size: 10)
                lbTitleButton.textColor = .white
                lbTitleButton.text = "Learn More"
                
                imgBackgroundBanner.isHidden = true
                contentView.backgroundColor = R.color.blueEAF1FF()!
            case .typeIdealHour:
                
                lbTitleBanner.font = R.font.poppinsRegular(size: 12)
                lbTitleBanner.textColor = .black
                lbDescriptionBanner.font = R.font.poppinsMedium(size: 14)
                lbDescriptionBanner.textColor = R.color.blue92A3FD()!
                
                buttonView.startColor = R.color.blue9DCEFF()!
                buttonView.endColor = R.color.blue92A3FD()!
                
                lbTitleButton.font = R.font.poppinsSemiBold(size: 10)
                lbTitleButton.textColor = .white
                lbTitleButton.text = "Learn More"
                
                imgBackgroundBanner.isHidden = true
                contentView.backgroundColor = R.color.blueEAF1FF()!
            }
        }
    }
    
    // MARK: - LifeCycle
    
    override func configureView() {
        super.configureView()
        typeBanner = .typeIdealHour
    }
    
    // MARK: - Function
    
    func configDataBaner(typeBaner: TypeBanner, title: String, description: String, dataImage: String? = nil) {
        
    }
}

// MARK: - Private

private extension BannerComponentCardView {
    
    func setupUI() {
        
    }
    
    // MARK: - Action
    
    @IBAction func didTapButton(_ sender: Any) {
        
    }
}
