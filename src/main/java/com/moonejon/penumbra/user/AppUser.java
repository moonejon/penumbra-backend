package com.moonejon.penumbra.user;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Entity
public class AppUser {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "appUserIdSeqGen")
    @SequenceGenerator(name = "appUserIdSeqGen", sequenceName = "app_user_id_seq", allocationSize = 1)
    private Integer id;

    @Column(name = "clerk_id", nullable = false)
    private String clerkId;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "name")
    private String name;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;

    @Column(name = "profile_image_url")
    private String profileImageUrl;

    @Column(name = "github_url")
    private String githubUrl;

    @Column(name = "instagram_url")
    private String instagramUrl;

    @Column(name = "letterboxd_url")
    private String letterboxdUrl;

    @Column(name = "linkedin_url")
    private String linkedinUrl;

    @Column(name = "spotify_url")
    private String spotifyUrl;
}
