package com.spring.board.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.HomeController;
import com.spring.board.dao.BoardDao;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;


@Service
public class boardServiceImpl implements boardService{

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);	
	@Autowired
	BoardDao boardDao;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectTest();
	}
	
	@Override
	public List<BoardVo> SelectBoardList(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		
		return boardDao.selectBoardList(pageVo);
	}
	
	@Override
	public int selectBoardCnt() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectBoardCnt();
	}
	
	@Override
	public BoardVo selectBoard(String boardType, int boardNum) throws Exception {
		// TODO Auto-generated method stub
		BoardVo boardVo = new BoardVo();
		
		boardVo.setBoardType(boardType);
		boardVo.setBoardNum(boardNum);
		
		return boardDao.selectBoard(boardVo);
	}
	
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		

		
		String boardTitle = boardVo.getBoardTitle();
		String comment = boardVo.getBoardComment();
		String[] titleArray = boardTitle.split(",");
		String[] commentArray = comment.split(",");
		
		for(int i = 0; i < titleArray.length;i++) {
			logger.info(titleArray[i]);
			logger.info(commentArray[i]);
			boardVo.setBoardTitle(titleArray[i]);
			boardVo.setBoardComment(commentArray[i]);
			logger.info(titleArray[i]);
			logger.info(commentArray[i]);
		}
		
		return boardDao.boardInsert(boardVo);
	}

	@Override
	public int removeArticle(int boardNum) throws Exception {
		return boardDao.deleteArticle(boardNum);
	}

	@Override
	public int update(BoardVo boardVo) throws Exception {
		return boardDao.update(boardVo);
	}

	@Override
	public BoardVo read(int boardNum) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.read(boardNum);
	}


}
