package com.moonejon.penumbra.user;

import java.time.Instant;
import java.time.ZoneOffset;

public record AppUserResponse(
        Integer id,
        String name,
        Instant createdAt,
        Instant updatedAt,
        String profileImageUrl,
        String githubUrl,
        String instagramUrl,
        String letterboxdUrl,
        String linkedinUrl,
        String spotifyUrl
) {
    public static AppUserResponse from (AppUser appUser) {
        return new AppUserResponse(
                appUser.getId(),
                appUser.getName(),
                appUser.getCreatedAt().atZone(ZoneOffset.UTC).toInstant(),
                appUser.getUpdatedAt().atZone(ZoneOffset.UTC).toInstant(),
                appUser.getProfileImageUrl(),
                appUser.getGithubUrl(),
                appUser.getInstagramUrl(),
                appUser.getLetterboxdUrl(),
                appUser.getLinkedinUrl(),
                appUser.getSpotifyUrl()
        );
    }
}
