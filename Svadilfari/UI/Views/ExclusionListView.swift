//
//  ExclusionListView.swift
//  ExclusionListView
//
//  Created by Shun Kashiwa on 2021/08/18.
//

import SwiftUI
import CoreData

struct ExclusionListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: ExclusionEntryEntity.entity(),
        sortDescriptors: [
            NSSortDescriptor(key: "domain", ascending: true),
            NSSortDescriptor(key: "path", ascending: true)
        ],
        predicate: nil,
        animation: .default
    )
    private var entries: FetchedResults<ExclusionEntryEntity>

    var body: some View {
        List {
            Section(footer: Text("Svadilfari will not detect gestures in the above domains or pages")) {
                ForEach(entries) { entry in
                    let str = "\(entry.domain ?? "")\(entry.path ?? "")"
                    Text(str)
                }
            }
        }.navigationTitle("Exclusion List")
    }
}

struct ExclusionListView_Previews: PreviewProvider {
    static var previews: some View {
        ExclusionListView()
    }
}
