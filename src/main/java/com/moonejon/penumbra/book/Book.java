package com.moonejon.penumbra.book;

import jakarta.persistence.*;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;

@Entity
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idSeqGen")
    @SequenceGenerator(name = "idSeqGen", sequenceName = "book_id_seq", allocationSize = 1)
    private Integer id;

    @Column(name = "owner_id", nullable = false, unique = false)
    private Integer ownerId;

    @Column(name = "isbn10", length = 10, nullable = false)
    private String isbn10;

    @Column(name = "isbn13", length = 13, nullable = false)
    private String isbn13;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "title_long", nullable = false)
    private String titleLong;

    @Column(name = "language", nullable = false)
    private String language;

    @Column(name = "synopsis", nullable = false)
    private String synopsis;

    @Column(name = "image", nullable = false)
    private String compressedImageUrl;

    @Column(name = "image_original", nullable=false)
    private String originalImageUrl;

    @Column(name = "edition")
    private String edition;

    @Column(name = "page_count", nullable = false)
    private Integer pageCount;

    @JdbcTypeCode(SqlTypes.ARRAY)
    @Column(name = "authors", columnDefinition = "text[]")
    private String[] authors;

    @Column(name = "binding", nullable = false)
    private String binding;

    @JdbcTypeCode(SqlTypes.ARRAY)
    @Column(name = "subjects", columnDefinition = "text[]")
    private String[] subjects;

    @Column(name = "date_published", nullable = false)
    private String datePublished;

    @Column(name = "publisher", nullable = false)
    private String publisher;

    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    @Column(name = "visibility")
    private BookVisibility visibility;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "read_date")
    private LocalDateTime readDate;

    @Column (name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;



    //    protected Book() {};

}

