package com.moonejon.penumbra.book;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1/books")
public class BookController {

    private final BookService bookService;

    public BookController(BookService bookService) { this.bookService = bookService; }

    @GetMapping("/")
    public List<BookResponse> getBooks(){
        return bookService.listAllBooks();
    }

    @GetMapping("/{id}")
    public ResponseEntity<BookResponse> getBookById(@PathVariable Integer id){
        return ResponseEntity.of(bookService.findById(id));
    }
}


