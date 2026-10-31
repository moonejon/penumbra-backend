package com.moonejon.penumbra.book;

import java.time.Instant;
import java.time.ZoneOffset;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

public record BookResponse(
        Integer id,
        String isbn10,
        String isbn13,
        String title,
        String titleLong,
        String language,
        String synopsis,
        String compressedImageUrl,
        String originalImageUrl,
        String edition,
        Integer pageCount,
        List<String> authors,
        String binding,
        List<String> subjects,
        String datePublished,
        String publisher,
        BookVisibility visibility,
        Instant createdAt,
        Instant readDate,
        Instant updatedAt
) {
    public static BookResponse from(Book book) {
        return new BookResponse(
                book.getId(),
                book.getIsbn10(),
                book.getIsbn13(),
                book.getTitle(),
                book.getTitleLong(),
                book.getLanguage(),
                book.getSynopsis(),
                book.getCompressedImageUrl(),
                book.getOriginalImageUrl(),
                book.getEdition(),
                book.getPageCount(),
                List.of(Objects.requireNonNullElse(book.getAuthors(), new String[0])),
                book.getBinding(),
                List.of(Objects.requireNonNullElse(book.getSubjects(), new String[0])),
                book.getDatePublished(),
                book.getPublisher(),
                book.getVisibility(),
                book.getCreatedAt().atZone(ZoneOffset.UTC).toInstant(),
                Optional.ofNullable(book.getReadDate()).map(d -> d.toInstant(ZoneOffset.UTC)).orElse(null),
                book.getUpdatedAt().atZone(ZoneOffset.UTC).toInstant()
        );
    }
}
