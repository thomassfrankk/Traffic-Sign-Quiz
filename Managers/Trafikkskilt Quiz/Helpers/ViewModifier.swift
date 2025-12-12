//
//  ViewModifier.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 27/11/25.
//

import SwiftUI

// MARK: - Label modifier (applies to the Text inside the Button)
struct PrimaryButtonLabel: ViewModifier {
    let isSmall: Bool
    let isPad: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.custom("SairaStencilOne-Regular", size: isSmall ? 25 : 30))
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .tracking(isSmall ? 1 : 2)
            .frame(maxWidth: isPad ? 600 : .infinity)
            .padding(.vertical, isSmall ? 0 : 4)
            .brightness(0.1)
            .layoutPriority(1)
    }
}

extension View {
    func primaryButtonLabel(isSmall: Bool, isPad: Bool) -> some View {
        modifier(PrimaryButtonLabel(isSmall: isSmall, isPad: isPad))
    }
}


// MARK: - Button container modifier (applies to the Button itself)
struct PrimaryButtonContainer: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .tint(.accent)
            .foregroundStyle(.white)
            .buttonStyle(.glassProminent)
            .controlSize(.large)
            .frame(maxWidth: 600)
    }
}

extension View {
    func primaryButtonContainer() -> some View {
        modifier(PrimaryButtonContainer())
    }
}


// MARK: - Secondary Button Label
struct SecondaryButtonLabel: ViewModifier {
    let isSmall: Bool
    let isPad: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.custom("SairaStencilOne-Regular", size: isSmall ? 20 : 22))
            .tracking(1)
            .frame(maxWidth: isPad ? 600 : .infinity)
            .brightness(0.1)
            .padding(.vertical, isSmall ? 3 : 6)
    }
}

extension View {
    func secondaryButtonLabel(isSmall: Bool, isPad: Bool) -> some View {
        modifier(SecondaryButtonLabel(isSmall: isSmall, isPad: isPad))
    }
}


// MARK: - Secondary Button Container
struct SecondaryButtonContainer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .tint(.blue.opacity(0.4))
            .foregroundStyle(.white)
            .buttonStyle(.glassProminent)
            .controlSize(.regular)
            .frame(maxWidth: 600)
    }
}

extension View {
    func secondaryButtonContainer() -> some View {
        modifier(SecondaryButtonContainer())
    }
}

// MARK: - Tertiary Button Label
struct TertiaryButtonLabel: ViewModifier {
    let isSmall: Bool
    let isPad: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.custom("SairaStencilOne-Regular", size: isSmall ? 18 : isPad ? 24 : 20))
            .lineLimit(1)
            .minimumScaleFactor(0.8)
            .frame(maxWidth: .infinity)
    }
}

extension View {
    func tertiaryButtonLabel(isSmall: Bool, isPad: Bool) -> some View {
        modifier(TertiaryButtonLabel(isSmall: isSmall, isPad: isPad))
    }
}


// MARK: - Tertiary Button Container (Tint Customizable)
struct TertiaryButtonContainer: ViewModifier {
    let tint: Color
    
    func body(content: Content) -> some View {
        content
            .tint(tint)
            .foregroundStyle(.white)
            .buttonStyle(.glassProminent)
            .controlSize(.regular)
    }
}

extension View {
    func tertiaryButtonContainer(tint: Color) -> some View {
        modifier(TertiaryButtonContainer(tint: tint))
    }
}

struct TitleTextModifier: ViewModifier {
    let isSmall: Bool
    let isPad: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.custom("SairaStencilOne-Regular", size: isSmall ? 26 : isPad ? 32 : 28))
            .minimumScaleFactor(0.4)
            .foregroundStyle(.white)
            .brightness(0.05)
    }
}

extension View {
    func titleTextStyle(isSmall: Bool, isPad: Bool) -> some View {
        modifier(TitleTextModifier(isSmall: isSmall, isPad: isPad))
    }
}

struct SubtitleTextModifier: ViewModifier {
    let isSmall: Bool
    let isPad: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.custom("SairaStencilOne-Regular", size: isSmall ? 20 : isPad ? 24 : 22))
            .foregroundStyle(.white)
            .opacity(0.7)
            .tracking(1)
            .multilineTextAlignment(.center)
//            .frame(maxWidth: .infinity)
            .frame(maxWidth: isPad ? 600 : .infinity)
    }
}

extension View {
    func subtitleTextStyle(isSmall: Bool, isPad: Bool) -> some View {
        modifier(SubtitleTextModifier(isSmall: isSmall, isPad: isPad))
    }
}
