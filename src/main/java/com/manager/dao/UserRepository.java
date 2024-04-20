package com.manager.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.manager.entity.User;

import java.util.List;


public interface UserRepository extends JpaRepository<User, Integer> {

    public List<User> findUserByName(String name);

    @Query("select u from User u where u.Email=:email")
    public User findByUserEmail(@Param("email") String email);


}
