package org.zerock.sample;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class SampleTest {
	@Setter(onMethod_ = @Autowired)
	private Restaurant restaurant;
	
	@Test
	public void testExist() {
		assertNotNull(restaurant);
		log.info(restaurant);
		log.info("-----------------------");
		log.info(restaurant.getChef());
	}
}











