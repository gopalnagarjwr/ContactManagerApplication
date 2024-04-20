package com.manager.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.manager.dao.UserRepository;
import com.manager.entity.User;

public class CustomUserDetailService implements UserDetailsService {

    @Autowired
    private UserRepository userRepo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepo.findByUserEmail(username);
        try {
            if (user == null) {
                throw new UsernameNotFoundException("this user not avalible...");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        CustomUserDetail customUserDetail = new CustomUserDetail(user);

        return customUserDetail;
    }

}
