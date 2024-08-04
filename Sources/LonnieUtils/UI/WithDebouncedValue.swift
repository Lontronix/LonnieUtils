//
//  WithDebouncedValue.swift
//  LonnieUtils
//
//  Created by Lonnie Gerol on 8/4/24.
//

import SwiftUI
import Combine

public struct DebouncedValue<T>: ViewModifier where T: Equatable {

    public typealias DebounceDuration = RunLoop.SchedulerTimeType.Stride

    @Binding var debouncedValue: T
    @Binding var nonDebouncedValue: T

    private let debounceDuration: DebounceDuration
    private let valueChangedPublisher = PassthroughSubject<T, Never>()

    init(
        debouncedValue: Binding<T>,
        nonDebouncedValue: Binding<T>,
        debounceDuration: DebounceDuration
    ) {
        self._nonDebouncedValue = nonDebouncedValue
        self._debouncedValue = debouncedValue
        self.debounceDuration = debounceDuration
    }

    public func body(content: Content) -> some View {
        content
            .onChange(of: nonDebouncedValue) {
                valueChangedPublisher.send(nonDebouncedValue)
            }
            .onReceive(
                valueChangedPublisher
                    .debounce(for: debounceDuration, scheduler: RunLoop.main)
            ) { updatedDebouncedValue in
                debouncedValue = updatedDebouncedValue
            }
    }
}

public extension View {

    func withDebouncedValue<T>(
        debouncedValue: Binding<T>,
        nonDebouncedValue: Binding<T>,
        debounceDuration: DebouncedValue.DebounceDuration = 0.20
    ) -> some View where T: Equatable {
        modifier(
            DebouncedValue(
                debouncedValue: debouncedValue,
                nonDebouncedValue: nonDebouncedValue,
                debounceDuration: debounceDuration
            )
        )
    }

}
