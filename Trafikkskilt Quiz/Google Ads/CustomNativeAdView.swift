//
//  CustomNativeAdView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 14/10/25.
//

import SwiftUI
import GoogleMobileAds

// MARK: - Custom Native Ad View
class CustomNativeAdView: NativeAdView {
    // MARK: - UI Components
    let adAttributionLabel = UILabel()
    let headlineLabel = UILabel()
    let bodyLabel = UILabel()
    let callToActionButton = UIButton(type: .system)
    let iconImageView = UIImageView()
    let media = MediaView()
    
    var lastAdID: ObjectIdentifier?
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    // MARK: - Layout Setup
    private func setupLayout() {
        // MARK: - Card styling
        self.backgroundColor = UIColor.systemGray5
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        
        // MARK: - Media view
        media.translatesAutoresizingMaskIntoConstraints = false
        media.contentMode = .scaleAspectFill
        media.clipsToBounds = true
        media.heightAnchor.constraint(greaterThanOrEqualToConstant: 120).isActive = true
        
        // MARK: - Attribution label
        adAttributionLabel.text = "Ad"
        adAttributionLabel.font = .boldSystemFont(ofSize: 12)
        adAttributionLabel.textColor = .white
        adAttributionLabel.backgroundColor = .systemOrange
        adAttributionLabel.textAlignment = .center
        adAttributionLabel.layer.masksToBounds = true
        adAttributionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let mediaWrapper = UIView()
        mediaWrapper.translatesAutoresizingMaskIntoConstraints = false
        mediaWrapper.addSubview(media)
        mediaWrapper.addSubview(adAttributionLabel)
        
        NSLayoutConstraint.activate([
            media.topAnchor.constraint(equalTo: mediaWrapper.topAnchor),
            media.leadingAnchor.constraint(equalTo: mediaWrapper.leadingAnchor),
            media.trailingAnchor.constraint(equalTo: mediaWrapper.trailingAnchor),
            media.bottomAnchor.constraint(equalTo: mediaWrapper.bottomAnchor),
            
            adAttributionLabel.topAnchor.constraint(equalTo: mediaWrapper.topAnchor),
            adAttributionLabel.leadingAnchor.constraint(equalTo: mediaWrapper.leadingAnchor),
            adAttributionLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 37.5),
            adAttributionLabel.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        // MARK: - Headline
        headlineLabel.font = .boldSystemFont(ofSize: 18)
        headlineLabel.textColor = .label
        headlineLabel.numberOfLines = 0
        
        // MARK: - Body
        bodyLabel.font = .systemFont(ofSize: 15)
        bodyLabel.textColor = .secondaryLabel
        bodyLabel.numberOfLines = 0
        
        // MARK: - CTA button
        let title = nativeAd?.callToAction ?? "Learn More"
        let font = UIFont.systemFont(ofSize: 16, weight: .bold)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.label
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        
        var config = UIButton.Configuration.filled()
        config.attributedTitle = AttributedString(attributedTitle)
        config.baseBackgroundColor = .systemGray4
        config.baseForegroundColor = .label
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)
        config.cornerStyle = .capsule
        
        callToActionButton.configuration = config
        callToActionButton.isUserInteractionEnabled = false
        
        // MARK: - Vertical layout
        let container = UIStackView()
        container.axis = .vertical
        container.translatesAutoresizingMaskIntoConstraints = false
        container.isLayoutMarginsRelativeArrangement = true
        container.layoutMargins = UIEdgeInsets(top: 0, left: 15, bottom: 15, right: 15)
        
        container.addArrangedSubview(headlineLabel)
        container.setCustomSpacing(8, after: headlineLabel)
        container.addArrangedSubview(bodyLabel)
        container.setCustomSpacing(15, after: bodyLabel)
        container.addArrangedSubview(callToActionButton)
        
        let mainStack = UIStackView(arrangedSubviews: [mediaWrapper, container])
        mainStack.axis = .vertical
        mainStack.spacing = 15
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // MARK: - Register views
        self.headlineView = headlineLabel
        self.bodyView = bodyLabel
        self.callToActionView = callToActionButton
        self.mediaView = media
    }
    
    // MARK: - Media aspect ratio application
    private var mediaHeightConstraint: NSLayoutConstraint?
    
    func applyMediaAspectRatio() {
        // Remove any previous height constraint
        if let constraint = mediaHeightConstraint {
            media.removeConstraint(constraint)
            mediaHeightConstraint = nil
        }
        
        if let aspectRatio = nativeAd?.mediaContent.aspectRatio, aspectRatio > 0 {
            mediaHeightConstraint = media.heightAnchor.constraint(equalTo: media.widthAnchor, multiplier: 1 / aspectRatio)
        } else {
            mediaHeightConstraint = media.heightAnchor.constraint(equalTo: media.widthAnchor, multiplier: 1)
        }
        
        mediaHeightConstraint?.isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let path = UIBezierPath(
            roundedRect: adAttributionLabel.bounds,
            byRoundingCorners: [.bottomRight],
            cornerRadii: CGSize(width: 5, height: 5)
        )
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        adAttributionLabel.layer.mask = mask
    }
}

// MARK: - SwiftUI Wrapper
struct AdMobNativeAdView: UIViewRepresentable {
    let nativeAd: NativeAd
    let maxWidth: CGFloat
    @Binding var measuredHeight: CGFloat
    
    func makeUIView(context: Context) -> CustomNativeAdView {
        let view = CustomNativeAdView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let widthConstraint = view.widthAnchor.constraint(equalToConstant: maxWidth)
        widthConstraint.isActive = true
        return view
    }
    
    func updateUIView(_ uiView: CustomNativeAdView, context: Context) {
        if uiView.nativeAd === nativeAd {
            return
        }
        
        uiView.nativeAd = nativeAd
        (uiView.headlineView as? UILabel)?.text = nativeAd.headline
        (uiView.bodyView as? UILabel)?.text = nativeAd.body
        (uiView.callToActionView as? UIButton)?.setTitle(nativeAd.callToAction, for: .normal)
        (uiView.iconView as? UIImageView)?.image = nativeAd.icon?.image
        uiView.mediaView?.mediaContent = nativeAd.mediaContent
        
        uiView.applyMediaAspectRatio()
        
        DispatchQueue.main.async {
            uiView.setNeedsLayout()
            uiView.layoutIfNeeded()
            let size = uiView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            if self.measuredHeight != size.height {
                self.measuredHeight = size.height
            }
        }
    }
}
