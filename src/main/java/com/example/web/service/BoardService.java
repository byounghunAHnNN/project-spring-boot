package com.example.web.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.web.config.auth.PrincipalDetail;
import com.example.web.model.Board;
import com.example.web.model.Reply;
import com.example.web.model.User;
import com.example.web.repository.BoardRepository;
import com.example.web.repository.ReplyRepository;

@Service //스프링이 컴포넌트 스캔을 통해서 bean에 등록해줌 IoC! 메모리에 띄워주겠따..
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private ReplyRepository replyRepository;

	@Transactional // 전체가 성공하면 commit, 실패하면 rollback <물론 로직 다 짜야함>
	public void 글쓰기(Board board, User user) { // title,content
		board.setCount(0);
		board.setUser(user);
		boardRepository.save(board);
	}

	@Transactional
	public Page<Board> 글목록(Pageable pageable){
		return boardRepository.findAll(pageable);
    }

	@Transactional
	public Board 글상세보기(int id) {
		return boardRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패:아이디 찾을 수 없습니다.");
				});
	}

	@Transactional
	 public void 글삭제하기(int id, PrincipalDetail principal) {
        Board board = boardRepository.findById(id).orElseThrow(() -> {
            return new IllegalArgumentException("글 찾기 실패 : 해당 글이 존재하지 않습니다.");
        });

        if (board.getUser().getId() != principal.getUser().getId()) {
            throw new IllegalStateException("글 삭제 실패 : 해당 글을 삭제할 권한이 없습니다.");
        }
        boardRepository.delete(board);
	}
	
	@Transactional
	 public void androidBoardDeleteService(int id, User user) {
       Board board = boardRepository.findById(id).orElseThrow(() -> {
           return new IllegalArgumentException("글 찾기 실패 : 해당 글이 존재하지 않습니다.");
       });

       if (board.getUser().getId() != user.getId()) {
           throw new IllegalStateException("글 삭제 실패 : 해당 글을 삭제할 권한이 없습니다.");
       }
       boardRepository.delete(board);
	}
	
	@Transactional
	public void 글수정하기(int id, Board requestBoard) {
		Board board = boardRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 찾기 실패:아이디 찾을 수 없습니다.");
				}); //영속화 작업
		board.setTitle(requestBoard.getTitle());
		board.setContent(requestBoard.getContent());
		// 해당 함수로 종료시에 트랜잭션이 Service가 종료될 때 트랜잭션종료. 더티체킹 < 영속화로 데이터변경후 자동업데이트되는<flush> >
	}
	
	@Transactional
	public void 댓글쓰기(User user, int boardId, Reply requestReply) {
		Board board = boardRepository.findById(boardId).orElseThrow(()->{
			return new IllegalArgumentException("댓글쓰기 실패: 해당 아이디 찾을 수 없습니다.");
		});
		
		requestReply.setUser(user);
		requestReply.setBoard(board);
		
		replyRepository.save(requestReply);
	}
	
	@Transactional
	public void androidBoardReplyWriteService(User user, int boardId, Reply requestReply) {
		Board board = boardRepository.findById(boardId).orElseThrow(()->{
			return new IllegalArgumentException("댓글쓰기 실패: 해당 아이디 찾을 수 없습니다.");
		});
		
		requestReply.setUser(user);
		requestReply.setBoard(board);
		
		replyRepository.save(requestReply);
	}
	
	public void 댓글삭제(int replyId, PrincipalDetail principal) {
		 Reply reply = replyRepository.findById(replyId).orElseThrow(() -> {
	            return new IllegalArgumentException("댓글 찾기 실패 : 해당 댓글이 존재하지 않습니다.");
	        });

	        if (reply.getUser().getId() != principal.getUser().getId()) {
	            throw new IllegalStateException("댓글 삭제 실패 : 해당 글을 삭제할 권한이 없습니다.");
	        }
		replyRepository.deleteById(replyId);
	}
}