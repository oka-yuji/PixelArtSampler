//
//  ContentView.swift
//  PixelArtSampler
//
//  Created by oka yuuji on 2022/09/30.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = Model()
    var body: some View {
        VStack {
            VStack {
                ForEach(0..<10) { column in
                    HStack {
                        ForEach(0..<10) { row in
                            Rectangle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(
                                    model.selectedcolumn == column &&
                                    model.selectedRow == row ||
                                    model.saveIndex.contains(where: { (indexRow, indexColumn) in
                                        indexRow == row && indexColumn == column
                                    }) ? .red : .clear
                                )
                                .background(
                                    Rectangle()
                                        .stroke(lineWidth: 1)
                                )
                                .animation(.easeInOut, value: model.selectedcolumn)
                                .animation(.easeInOut, value: model.selectedRow)
                        }
                    }
                }
            }
            .padding(.bottom, 40)
            HStack {
                VStack {
                    ArrowButton(arrow: "↑", model: model)
                    HStack(spacing: 80) {
                        ArrowButton(arrow: "←", model: model)
                        ArrowButton(arrow: "→", model: model)
                    }
                    ArrowButton(arrow: "↓", model: model)
                }
                Spacer()
                Button {
                    model.saveIndex.append((model.selectedRow, model.selectedcolumn))
                } label: {
                    Text("tap!")
                        .frame(width: 100, height: 100)
                        .background(
                            Circle()
                                .stroke(lineWidth: 1)
                        )
                }
            }
            .padding(.horizontal, 16)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ArrowButton: View {
    @State var arrow: String
    @ObservedObject var model: Model
    var body: some View {
        Button {
            switch arrow {
            case "↑":
                if model.selectedcolumn > 0 {
                    model.selectedcolumn -= 1
                }
            case "↓":
                if model.selectedcolumn < 9 {
                    model.selectedcolumn += 1
                }
            case "→":
                if model.selectedRow < 9 {
                    model.selectedRow += 1
                }
            case "←":
                if model.selectedRow > 0 {
                    model.selectedRow -= 1
                }
            default:
                return
            }
        } label: {
            Text(arrow)
                .font(.system(size: 60))
        }
    }
}
