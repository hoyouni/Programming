package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	/*
	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}
	*/
	
	/*
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setTitle("new Title");
		board.setContent("new Content");
		board.setWriter("user01");
		
		mapper.insert(board);
		
		log.info(board);
	}
	*/
	
	/*
	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("new Title by Select Key");
		board.setContent("new Content by Select Key");
		board.setWriter("user01");
		
		mapper.insertSelectKey(board);
		
		log.info(board);
		
	}
	*/
	
	/*
	@Test
	public void testRead() {
		BoardVO board = mapper.read(5L);
		log.info(board);
	}
	*/
	
	/*
	@Test
	public void testDelete() {
		int count = mapper.delete(3L);
		log.info("DELETE COUNT : " + count);
	}
	*/
	
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(5L);
		board.setTitle("Update Title");
		board.setContent("Update Content");
		board.setWriter("user00");
		
		int count = mapper.update(board);
		log.info("UPDATE COUNT : " + count);
	}
}





















