//
//  AsyncTest.swift
//  AsyncAwaitTest
//
//  Created by Andres Felipe Ocampo Eljaiek on 21/01/2021.
//

import Foundation

func getUserId(completionHandler: @escaping (Int) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        completionHandler(42)
    }
}

// Async Method
func getUserId() async -> Int {
    return await withUnsafeContinuation({ continuation in
        getUserId { userId in
            continuation.resume(returning: userId)
        }
    })
}

func getUserFirstName(userId: Int, completionHandler: @escaping (String) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        completionHandler("Felipe")
    }
}

// Async method
func getUserFirstName(userId: Int) async -> String {
    return await withUnsafeContinuation({ continuation in
        getUserFirstName(userId: userId) { firstName in
            continuation.resume(returning: firstName)
        }
    })
}

func getUserLastName(userId: Int, completionHandler: @escaping (String) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        completionHandler("Eljaiek")
    }
}

// Async Method
func getUserLastName(userId: Int) async -> String {
    return await withUnsafeContinuation({ continuation in
        getUserLastName(userId: userId) { lastName in
            continuation.resume(returning: lastName)
        }
    })
}

// Async method
@asyncHandler func greetUserDataAsync() {
    let userId = await getUserId()
    let firstName = await getUserFirstName(userId: userId)
    let lastName = await getUserLastName(userId: userId)
    print("Hello \(firstName) \(lastName)")
}

func greetUser() {
    getUserId { userId in
        getUserFirstName(userId: userId) { firstName in
            getUserLastName(userId: userId) { lastName in
                print("Hello \(firstName) \(lastName)")
            }
        }
    }
}
