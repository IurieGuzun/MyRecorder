//
//  MyRecorderApp.swift
//  MyRecorder
//
//  Created by Iurie Guzun on 2022-01-30.
//

import SwiftUI

@main
struct MyRecorderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(audioRecorder: AudioRecorder())
        }
    }
}
