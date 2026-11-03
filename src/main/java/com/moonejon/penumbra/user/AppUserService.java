package com.moonejon.penumbra.user;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AppUserService {


    private final AppUserRepository appUserRepository;

    public AppUserService(AppUserRepository appUserRepository) { this.appUserRepository = appUserRepository; }

    public List<AppUserResponse> listAllUsers() {
        return appUserRepository.findAll().stream().map(AppUserResponse::from).toList();
    }

    public Optional<AppUserResponse> findById(Integer id) {
        return appUserRepository.findById(id).map(AppUserResponse::from);
    }
}
