package com.manager.dao;

import com.manager.entity.Contacts;
import com.manager.entity.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ContactRepository extends JpaRepository<Contacts, Integer> {


    public Page<Contacts> findAllByU_Id(int id, Pageable pageable);

    public Page<Contacts> findAllByNameAndU_Id(String prefix, int id, Pageable pageable);

    public Page<Contacts> findAllByNameContainsIgnoreCaseAndU_Id(String prefix, int id, Pageable pageable);


}
