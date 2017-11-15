//
//  TypedNotifications.swift
//  CueCards
//
//  Created by Ilya Denisov on 11/15/17.
//  Copyright © 2017 Ilya Denisov. All rights reserved.
//


import Foundation

class Box<T> {
    let unbox: T
    init(_ value: T) { self.unbox = value }
}

struct TypedNotification<A> {
    let name: String
}

func postTypedNotification<A>(note: TypedNotification<A>, value: A) {
    let userInfo = ["value": Box(value)]
    NotificationCenter.default.post(name: Notification.Name(note.name), object: nil, userInfo: userInfo)
}

class NotificationObserver {
    let observer: NSObjectProtocol
    
    init<A>(notification: TypedNotification<A>, block aBlock: @escaping (A) -> ()) {
        observer = NotificationCenter.default.addObserver(forName: Notification.Name(notification.name), object: nil, queue: nil, using: { (note) in
            if let value = (note.userInfo?["value"] as? Box<A>)?.unbox {
                aBlock(value)
            } else {
                assert(false, "Couldn't understand user info")
            }
        })
    }
    
    deinit {
        NotificationCenter.default.removeObserver(observer)
    }
    
}

extension TypedNotification {
    enum type: String {
        case didPopViewController
    }
    
    init(_ type: type) {
        self = TypedNotification(name: type.rawValue)
    }
}

