package com.creat.manager.Test;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.create.managerMoney.bean.Fund;
import com.create.managerMoney.mapper.FundMapper;
import com.create.managerMoney.service.i.FundService;
import com.create.managerMoney.service.i.UserService;
import com.create.managerMoney.service.i.UseraccService;

public class SqlAddTest {
	private ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
	@Test
	public void test1(){
		 UseraccService useraccService = ioc.getBean(UseraccService.class);
		 useraccService.saveZhuceUserCreateAcc(4);
		
	}
	@Test
	public void test(){
		ClassPathXmlApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
		FundService fundService = ioc.getBean(FundService.class);
		FundMapper fundMapper = ioc.getBean(FundMapper.class);
		List<Fund> fundByPage = fundService.getFundByPage(1, 3000);
		for (Fund fund : fundByPage) {
			fund.setJjDwzj(fund.getJjDwzj().add(new BigDecimal(0.00)));
			fund.setJjId(null);
			fund.setJjLjjz(fund.getJjLjjz().add(new BigDecimal(0.0)));
			fund.setJjDate("2017_07_11 04_10_29");
		}
		fundMapper.insertList(fundByPage);
		System.out.println(fundByPage.size());
	}
	@Test
	public void test21(){
		BigDecimal bigDecimal1=new BigDecimal(1);
		BigDecimal bigDecimal2=new BigDecimal(99);
		BigDecimal divide = bigDecimal1.divide(bigDecimal2);
		System.out.println(divide);
	}
}
