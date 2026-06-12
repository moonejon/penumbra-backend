package com.moonejon.penumbra.book;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class BookComponent implements CommandLineRunner {

    @Override
    public void run(String... args) throws Exception {
        
        int totalBookCount = BookRepository.findAll().size();
    }
}
