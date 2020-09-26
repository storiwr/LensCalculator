//
//  ContentView.swift
//  Lens Calculator
//
//  Created by Stephen on 9/26/20.
//

import SwiftUI

struct ContentView: View {
    @State private var lens = "35"
    @State private var numberOfPeople = 2
    @State private var sensor = 1

    let sensors = [1, 1.5, 1.6, 2,]

    var effectiveFocalLength: Double {
        let sensorSelection = Double(sensors[sensor])
        let numLens = Double(lens) ?? 0

        
        let effectiveFocalLength = numLens / sensorSelection

        return effectiveFocalLength
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Lens Standard Focal Length")) {
                    HStack {
                        TextField("Lens Type", text: $lens)
                            .keyboardType(.numberPad)
                        Text("mm")

                    }

//                    Picker("Number of people", selection: $numberOfPeople) {
//                        ForEach(2 ..< 100) {
//                            Text("\($0) people")
//                        }
//                    }
                }

                Section(header: Text("Sensor Size")) {
                    Picker("Sensor Size", selection: $sensor) {
                        ForEach(0 ..< sensors.count) {
                            Text("\(self.sensors[$0], specifier: "%.1f")")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section (header: Text("Effective Focal Length"))
                    {
                    Text("\(effectiveFocalLength, specifier: "%.2f") mm")
                }
            }
            .navigationBarTitle("Lens Calculator")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
