package com.example.oauth2.repository;

import com.example.oauth2.model.Credentials;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CredentialRepository extends JpaRepository<Credentials, Long> {

    Credentials findByName(String name);
}
