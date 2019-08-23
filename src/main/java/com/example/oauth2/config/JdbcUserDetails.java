package com.example.oauth2.config;

import com.example.oauth2.model.Credentials;
import com.example.oauth2.repository.CredentialRepository;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import static org.slf4j.LoggerFactory.getLogger;

@Service
public class JdbcUserDetails implements UserDetailsService {

    private static final Logger LOGGER = getLogger(JdbcUserDetails.class);

    @Autowired
    private CredentialRepository credentialRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Credentials credentials = credentialRepository.findByName(username);
        LOGGER.info("User loaded with credential {}", credentials);
        if (credentials == null) {
            throw new UsernameNotFoundException("User " + username + " can not be found");
        }
        return new User(credentials.getName(), credentials.getPassword(), credentials.isEnabled(), true, true, true,
                        credentials.getAuthorities());

    }
}
