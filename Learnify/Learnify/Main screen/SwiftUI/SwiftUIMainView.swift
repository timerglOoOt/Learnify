//
//  SwiftUIMainView.swift
//  Learnify
//
//  Created by Тимур Хайруллин on 26.05.2024.
//

import SwiftUI

// MARK: - Хайруллин Тимур

struct SwiftUIMainView: View {
    @State private var searchText = ""
    @ObservedObject var viewModel = MainViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                List(viewModel.books) { book in
                    BookCellView(book: book)
                        .onAppear {
                            if book == viewModel.books.last {
                                viewModel.loadMoreBooks()
                            }
                        }
                    if viewModel.isLoading {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .onReceive(viewModel.errorMessage) { errorMessage in
                    let alert = UIAlertController(title: "Error", message: errorMessage.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
                }
            }
            .navigationTitle("Books")
            .onAppear {
                viewModel.getBooksByQuery(query: "")
            }
            .onChange(of: searchText) { newSearchText in
                viewModel.getBooksByQuery(query: newSearchText)
            }
            .padding(.bottom, 40)
        }
        .environmentObject(MainViewModel())
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .padding(.horizontal)
                .overlay(
                    HStack {
                        Spacer()
                        if !text.isEmpty {
                            Button(action: {
                                text = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 24)
                            }
                        }
                    }
                )
        }
    }
}

struct BookDetailView: View {
    let book: Book
    @State private var bookMark: Bool = false
    @EnvironmentObject var viewModel: MainViewModel

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)

                Text(book.description ?? "")
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .padding(.horizontal)

                Spacer()
            }

            Button(action: {
                bookMark.toggle()
                guard let userId = UserDefaults.standard.string(forKey: "curUser") else { return }
                let bookId = book.id
                if bookMark {
                    viewModel.addBookToFirebase(
                        userId: userId, bookId: bookId)
                } else {
                    viewModel.deleteBookFromFirebase(userId: userId, bookId: bookId)
                }
            }) {
                Image(systemName: bookMark ? "bookmark.fill" : "bookmark")
                    .resizable()
                    .frame(width: 25, height: 40)
                    .padding()
                    .foregroundColor(.blue)
            }
            .padding(.top, 16)
            .padding(.trailing, 16)
        }
    }
}

struct BookCellView: View {
    let book: Book
    @State private var bookMark: Bool = false
    var body: some View {
        HStack {
            if let bookImage = book.bookImage {
                Image(uiImage: bookImage)
                    .resizable()
                    .frame(width: 60, height: 80)
                    .cornerRadius(5)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(book.title)
                    .font(.headline)
                    .lineLimit(2)

                Text(book.authors?.arrayToString() ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)

                Text(book.description ?? "")
                    .font(.body)
                    .lineLimit(2)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(10)
        .background(
            NavigationLink("", destination: BookDetailView(book: book))
                .opacity(0)
        )
    }
}
