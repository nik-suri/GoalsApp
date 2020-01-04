//
//  LazyBox.swift
//  GoalsApp
//
//  Created by Nikhil Suri on 1/3/20.
//  Copyright © 2020 Nikhil Suri. All rights reserved.
//

private enum LazyValue<T> {
    case notYetComputed(() -> T)
    case computed(T)
}

final class DailyLazyBox<T> {
    init(computation: @escaping () -> T) {
        _value = .notYetComputed(computation)
    }

    private var _value: LazyValue<T>

    var value: T {
        switch self._value {
        case .notYetComputed(let computation):
            let result = computation()
            self._value = .computed(result)
            return result
        case .computed(let result):
            // if the local time is midnight, recompute
            return result
        }
    }
}
