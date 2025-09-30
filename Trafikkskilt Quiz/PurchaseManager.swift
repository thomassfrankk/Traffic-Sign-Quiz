//
//  PurchaseManager.swift
//  Trafikkskilt Quiz
//
//  Created by Thomas Frank on 29/9/25.
//

import StoreKit
import Combine

@MainActor
class PurchaseManager: ObservableObject {
    @Published var adFreeUnlocked = false
    @Published var adFreeProduct: Product? = nil
    private var updates: Task<Void, Never>? = nil
    
    init() {
        print("🟢 PurchaseManager init")
        updates = observeTransactions()
        Task {
            do {
                try await AppStore.sync()
                print("🔄 AppStore.sync() completed successfully")
            } catch {
                print("❌ AppStore.sync() failed: \(error)")
            }
            await checkPurchased()
            await loadProducts()
        }
    }
    
    deinit {
        updates?.cancel()
        print("🔴 PurchaseManager deinit")
    }
    
    func loadProducts() async {
        print("🛒 Loading products...")
        do {
            let products = try await Product.products(for: [IAPProducts.adFree])
            print("✅ Products fetched: \(products.map { $0.id })")
            
            if let product = products.first {
                await MainActor.run {
                    self.adFreeProduct = product
                    print("💰 Loaded product: \(product.displayName), price: \(product.displayPrice)")
                }
            } else {
                print("⚠️ No matching products found for ID: \(IAPProducts.adFree)")
            }
        } catch {
            print("❌ Failed to load product: \(error)")
        }
    }
    
    func purchaseAdFree() async {
        do {
            let product: Product
            if let adFreeProduct = adFreeProduct {
                product = adFreeProduct
                print("🛒 Using cached product: \(product.id)")
            } else {
                await loadProducts()
                guard let loadedProduct = adFreeProduct else {
                    print("❌ No product available for purchase")
                    return
                }
                product = loadedProduct
            }
            
            print("🛍️ Starting purchase for: \(product.id)")
            let result = try await product.purchase()
            
            switch result {
            case .success(let verification):
                if case .verified(let transaction) = verification {
                    adFreeUnlocked = true
                    print("🎉 Purchase verified! Transaction ID: \(transaction.id)")
                } else {
                    print("⚠️ Purchase unverified")
                }
            case .userCancelled:
                print("🚫 Purchase cancelled by user")
            case .pending:
                print("⏳ Purchase pending")
            @unknown default:
                print("❓ Unknown purchase result")
            }
        } catch {
            print("❌ Purchase failed: \(error)")
        }
    }
    
    func restorePurchases() async {
        print("♻️ Restoring purchases...")
        do {
            try await AppStore.sync()
            print("🔄 AppStore.sync() completed successfully during restore")
            for await result in Transaction.currentEntitlements {
                switch result {
                case .verified(let transaction):
                    print("✅ Verified restored entitlement: \(transaction.productID)")
                    if transaction.productID == IAPProducts.adFree {
                        adFreeUnlocked = true
                    }
                case .unverified(let transaction, let error):
                    print("⚠️ Unverified restored entitlement for \(transaction.productID): \(error)")
                }
            }
        } catch {
            print("❌ Restore purchases failed: \(error)")
        }
    }
    
    func checkPurchased() async {
        print("🔍 Checking entitlements...")
        for await result in Transaction.currentEntitlements {
            switch result {
            case .verified(let transaction):
                print("✅ Verified entitlement: \(transaction.productID)")
                if transaction.productID == IAPProducts.adFree {
                    adFreeUnlocked = true
                }
            case .unverified(let transaction, let error):
                print("⚠️ Unverified entitlement for \(transaction.productID): \(error)")
            }
        }
    }
    
    private func observeTransactions() -> Task<Void, Never> {
        Task.detached {
            print("👀 Observing transaction updates...")
            for await result in Transaction.updates {
                switch result {
                case .verified(let transaction):
                    print("📥 Transaction update verified: \(transaction.productID)")
                    if await transaction.productID == IAPProducts.adFree {
                        await MainActor.run { self.adFreeUnlocked = true }
                    }
                case .unverified(let transaction, let error):
                    print("⚠️ Transaction update unverified: \(transaction.productID), error: \(error)")
                }
            }
        }
    }
}

enum IAPProducts {
    static let adFree = "com.thomasfrank.trafikkskiltquiz.premium"
}
