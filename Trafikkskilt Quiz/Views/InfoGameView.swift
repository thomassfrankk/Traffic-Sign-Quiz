//
//  InfoGameView.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 28/11/25.
//

import SwiftUI

struct InfoGameView: View {
    
    @Environment(\.isPad) private var isPad
    @Environment(\.isSmall) private var isSmall
    @Environment(\.isLandscape) private var isLandscape
    
    let quizMode: QuizMode
    let languageManager: LanguageManager
    
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack(spacing: 16) {
                Image(systemName: "bolt.circle")
                    .font(.system(size: isSmall ? 50 : 150).weight(.semibold))
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.white, .accent)
                    .symbolEffect(.drawOn.byLayer, isActive: !isLoading)
                    .padding(.vertical)
                    .onAppear {
                        isLoading = true
                    }
                
                ForEach(quizMode.ruleDescription, id: \.self) { line in
                    Text(line)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(isSmall ? 18 : 22)
            .foregroundStyle(.white)
            .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
            
            
            Spacer()
//            Spacer()
            
            Text("Highscore: 13 Signs")
                .textCase(.uppercase)
                .foregroundStyle(Color("GameBackground"))
                .font(.title3.weight(.heavy))
                .padding(.horizontal, 32)
                .padding(.vertical)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 32)
                
            
            
            Button {
                
            } label: {
                Text("Play")
                .primaryButtonLabel(isSmall: isSmall, isPad: isPad)
            }
            .primaryButtonContainer()
        }
        .padding(.horizontal)
        .padding(.bottom, isSmall ? 16 : 0)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .init(horizontal: .center, vertical: .top))
        .background(Color("GameBackground").gradient)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .title) {
                Text(languageManager.localizedString(for: quizMode.rawValue))
                    .titleTextStyle(isSmall: isSmall, isPad: isPad)
            }
        }
    }
}

#Preview {
    NavigationStack {
        InfoGameView(quizMode: .grandPrix, languageManager: LanguageManager(settings: nil))
    }
}
