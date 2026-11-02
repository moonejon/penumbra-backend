package com.moonejon.penumbra.user;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RestController
@RequestMapping("/api/v1/users")
public class AppUserController {
    private final AppUserService appUserService;

    public AppUserController(AppUserService appUserService) { this.appUserService = appUserService; }

    @GetMapping()
    public List<AppUserResponse> getUsers(){
        return appUserService.listAllUsers();
    }

    @GetMapping("/{id}")
    public ResponseEntity<AppUserResponse> getUserById(@PathVariable Integer id){
        return ResponseEntity.of(appUserService.findById(id));
    }
}
