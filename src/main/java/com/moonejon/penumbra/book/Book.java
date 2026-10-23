package com.moonejon.penumbra.book;

import jakarta.persistence.*;
import lombok.Getter;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Getter
@Entity
public class Book {

    @Getter
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idSeqGen")
    @SequenceGenerator(name = "idSeqGen", sequenceName = "book_id_seq", allocationSize = 1)
    private Integer id;

    @Getter
    @Column(name = "owner_id", nullable = false, unique = false)
    private Integer ownerId;

    @Getter
    @Column(name = "isbn10", length = 10, nullable = false)
    private String isbn10;

    @Getter
    @Column(name = "isbn13", length = 13, nullable = false)
    private String isbn13;

    @Getter
    @Column(name = "title", nullable = false)
    private String title;

    @Getter
    @Column(name = "title_long", nullable = false)
    private String titleLong;

    @Getter
    @Column(name = "language", nullable = false)
    private String language;

    @Getter
    @Column(name = "synopsis", nullable = false)
    private String synopsis;

    @Getter
    @Column(name = "image", nullable = false)
    private String compressedImageUrl;

    @Getter
    @Column(name = "image_original", nullable=false)
    private String originalImageUrl;

    @Getter
    @Column(name = "edition")
    private String edition;

    @Getter
    @Column(name = "page_count", nullable = false)
    private Integer pageCount;

    @Getter
    @JdbcTypeCode(SqlTypes.ARRAY)
    @Column(name = "authors", columnDefinition = "text[]")
    private String[] authors;

    @Getter
    @Column(name = "binding", nullable = false)
    private String binding;

    @Getter
    @JdbcTypeCode(SqlTypes.ARRAY)
    @Column(name = "subjects", columnDefinition = "text[]")
    private String[] subjects;

    @Getter
    @Column(name = "date_published", nullable = false)
    private String datePublished;

    @Getter
    @Column(name = "publisher", nullable = false)
    private String publisher;

    @Getter
    @JdbcTypeCode(SqlTypes.NAMED_ENUM)
    @Column(name = "visibility")
    private BookVisibility visibility;

    @Getter
    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Getter
    @Column(name = "read_date")
    private LocalDateTime readDate;

    @Getter
    @Column (name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;

//    public List<String> getAuthorsList(){
//        return new ArrayList<>(Arrays.asList(authors));
//    }
//
//    public List<String> getSubjectsList() {
//        return new ArrayList<>(Arrays.asList(subjects));
//    }
//
//    public Instant getCreatedAt() {
//        return createdAt.atZone(ZoneId.systemDefault()).toInstant();
//    }
//
//    public Instant getReadDate() {
//        return readDate == null
//                ? null
//                : readDate.atZone(ZoneId.systemDefault()).toInstant();
//    }
//
//    public Instant getUpdatedAt() {
//        return updatedAt.atZone(ZoneId.systemDefault()).toInstant();
//    }


    //    protected Book() {};

}

