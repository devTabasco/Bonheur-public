package icia.team.bonheur;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

@Service("tranAssistant")
public class TransactionAssistant {
	@Autowired
	protected SqlSessionTemplate sqlSession;
	@Autowired
	private ApplicationContext applicationContext;
	
	protected SimpleTransactionManager getTransaction(boolean isRead) {
		SimpleTransactionManager tranMgr = applicationContext.getBean(SimpleTransactionManager.class);
		tranMgr.setTransactionConf(isRead);
		return tranMgr;
	}
	

}
