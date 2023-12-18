//
//  ContentView.swift
//  SwiftUISidebarListRowBackgroundHighlightBorder
//
//  Created by Simon Nickel on 18.12.23.
//

import SwiftUI

struct ContentView: View {
	
	@State private var selectedFolder: String?
	
	@State private var folders = [
		"All",
		"Favorites",
		"More"
	]
	
	var body: some View {
		
		NavigationSplitView {
			
			List(selection: $selectedFolder) {
				ForEach(folders, id: \.self) { folder in
					
					NavigationLink(value: folder) {
						Text(folder)
					}
					.if(selectedFolder == folder) { view in
						
						view.listRowBackground(
							Rectangle()
								.fill(.green)
								.mask(Rectangle().cornerRadius(10))
						)
						
					}
				}
			}
			.navigationTitle("Sidebar")
			
		} detail: {
			Text("Choose a folder from the sidebar")
		}
		
	}
}

extension View {
	/// Applies the given transform if the given condition evaluates to `true`.
	/// - Parameters:
	///   - condition: The condition to evaluate.
	///   - transform: The transform to apply to the source `View`.
	/// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
	@ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
		if condition {
			transform(self)
		} else {
			self
		}
	}
}

#Preview {
	ContentView()
}
