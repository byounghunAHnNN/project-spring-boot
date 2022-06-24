package com.example.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.web.model.Reply;

public interface ReplyRepository extends JpaRepository<Reply,Integer>{
	
}
