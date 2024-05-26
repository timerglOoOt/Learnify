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
    @State private var isLoading = false
    @State private var books: [Book] = []
    @State private var allBooksLoaded = true

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
//                    .padding(.horizontal)
                List {
                    ForEach(books.filter { searchText.isEmpty || $0.title.localizedCaseInsensitiveContains(searchText) }) { book in
                        BookCellView(book: book)
                            .background(
                                GeometryReader { geo -> Color in
                                    let maxY = geo.frame(in: .global).maxY
                                    if maxY < UIScreen.main.bounds.height && self.books.last == book {
                                        self.loadMoreBooks()
                                    }
                                    return Color.clear
                                }
                            )
                            .listRowBackground(Color.white)
                    }

                    if isLoading {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    }
                }
                .padding(.bottom, 40)
                .listStyle(PlainListStyle())
                .onAppear {
                    loadMoreBooks()
                }
            }
            .navigationTitle("Books")
        }
    }

    private func loadMoreBooks() {
        guard !isLoading && allBooksLoaded else { return }
        isLoading = true
        allBooksLoaded = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            books.append(contentsOf: [
                BookBuilder()
                    .addId(id: "\(Int.random(in: 1..<100000))")
                    .addImage(bookImage: UIImage(named: "book1") ?? UIImage())
                    .addAuthors(authors: ["Test4"])
                    .addTitle(title: "Title4")
                    .addDescription(description: "TestTitle4")
                    .build(),
                BookBuilder()
                    .addId(id: "\(Int.random(in: 1..<100000))")
                    .addImage(bookImage: UIImage(named: "book2") ?? UIImage())
                    .addAuthors(authors: ["Test5"])
                    .addTitle(title: "Title5")
                    .addDescription(description: "TestTitle5")
                    .build()
            ])
            isLoading = false
            allBooksLoaded = true
        }
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

    var body: some View {
        VStack {
            Text(book.title)
                .font(.title)

            Text(book.description ?? "")
                .font(.body)
                .padding()

            Spacer()
        }
        .navigationTitle(book.title)
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

                Text(book.authors?.arrayToString() ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(book.description ?? "")
                    .font(.body)
                    .lineLimit(2)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {
                bookMark.toggle()
            }) {
                Image(systemName: bookMark ? "bookmark.fill" : "bookmark")
                    .foregroundColor(.blue)
            }
        }
        .padding(10)
        .background(Color.white)
    }
}
