package com.example.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.web.model.Board;

// DAO
// 자동으로 BEAN 등록이 된다.
// @Repository가 생략된 것
public interface BoardRepository extends JpaRepository<Board,Integer>{

	Board findByTitle(String title);

	Board findByUserId(int id);

}
