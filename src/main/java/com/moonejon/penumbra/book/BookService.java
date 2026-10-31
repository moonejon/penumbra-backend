package com.moonejon.penumbra.book;

import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class BookService {

    private final BookRepository bookRepository;

    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public List<BookResponse> listAllBooks() {
        return bookRepository.findAll().stream().map(BookResponse::from).toList();
    };

    public Optional<BookResponse> findById(Integer id) {
        return bookRepository.findById(id).map(BookResponse::from);
    }
}