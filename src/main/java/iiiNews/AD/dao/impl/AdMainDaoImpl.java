package iiiNews.AD.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import iiiNews.AD.dao.AdMainDao;
import iiiNews.AD.model.AdBean;

@Repository
public class AdMainDaoImpl implements AdMainDao {
	
	@Autowired
	SessionFactory factory;
	
	Integer recordsPerPage = 5;
	
	public AdMainDaoImpl() {
	}


	// 新增一筆廣告資料
	// 利用save方法，儲存AdBean物件，將ab新增到Ad表格內。
	// 回傳int 若成功應該會回傳1
	@Override
	public int saveAds(AdBean ab) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(ab);
		n++;
		return n;
	}

	
	// 查詢全部廣告列表 一次查全部
	@SuppressWarnings("unchecked")
	@Override
	public List<AdBean> getAllAds() {
		String hql = "FROM AdBean WHERE stock > 0 AND status = 1";
		Session session = factory.getCurrentSession();
		List<AdBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	
	//抓最後一筆資料 為了新增時能查出最後一筆資料的廣告編號(AD2020102500001)
	//先設初值為null 若查無資料就回傳null 不處理例外
	@Override
	public AdBean getLastRecord() {
		String hql = "FROM AdBean ORDER BY uploadDate DESC";
		Session session = factory.getCurrentSession();
		AdBean adbean = null;
		try {
			adbean = (AdBean) session.createQuery(hql).setMaxResults(1).getSingleResult();
		}catch(NoResultException e) {
			;
		}
		return adbean;
	}

	
	//$$$$ 更新廣告上架資料 還沒測試沒寫完!!!!
	@Override
	public int updateAds(AdBean ab) {
//	public int updateAds(String adNo, AdBean ab) {
		int n = 0;
//		String hql = "UPDATE AdBean ab" 
//				+" SET ab.categoryNo=:cateNo, ab.width=:width, ab.height=:height, ab.adDate=:adDate,"
//				+" ab.price=:price, ab.stock=:stock"
//				+" WHERE ab.adNo";
		Session session = factory.getCurrentSession();
//		session.createQuery(hql).setParameter("cateNo", ab.getCategoryNo())
//								.setParameter("width", ab.getWidth())
//								.setParameter("height", ab.getHeight())
//								.setParameter("adDate", ab.getAdDate())
//								.setParameter("price", ab.getPrice())
//								.setParameter("stock", ab.getStock())
//								.executeUpdate();
		//$$$$ ..............
//		AdBean origin = session.get(AdBean.class, pkId);
		session.merge(ab);
		System.out.println("merge success!!!");
		n++;
		return n;
	}

	
	//以企業會員id來查詢該會員的上傳廣告清單
	@SuppressWarnings("unchecked")
	@Override
	public List<AdBean> getCpMemberAdList(String cpmemberId) {
		String hql = "FROM AdBean WHERE memberId = :mid";
		Session session = factory.getCurrentSession();
		List<AdBean> list = session.createQuery(hql)
							.setParameter("mid", cpmemberId)
							.getResultList();
		return list;
	}


	@Override
	public int deleteAdByMemberPkid(int pkId) {
		int n = 0;
		Session session = factory.getCurrentSession();
		AdBean ab = session.get(AdBean.class, pkId);
		session.delete(ab);
		n++;
		return n;
	}
	
	@Override
	public int offShelfAdByMemberPkid(int pkId) {
		int n = 0;
		Session session = factory.getCurrentSession();
		AdBean ab = session.get(AdBean.class, pkId);
		System.out.println(ab.getStatus());
		if(ab.getStatus() == 0) {
			System.out.println("0 to 1");
			ab.setStatus(1);
		}else {
			System.out.println("1 to 0");
			ab.setStatus(0);
		}
		
		session.update(ab);
		n++;
		return n;
	}


	@Override
	public AdBean getOneAdByadPk(int adPk) {
		Session session = factory.getCurrentSession();
		AdBean ab = session.get(AdBean.class, adPk);
		return ab;
	}

	
	//ajax
	@Override
	@SuppressWarnings("unchecked")
	public List<AdBean> getPageAds(Integer pageNo) {
		int startRecordNo = (pageNo - 1) * recordsPerPage;
		String hql = "FROM AdBean WHERE stock > 0 AND status = 1";
		Session session = factory.getCurrentSession();
		List<AdBean> list = session.createQuery(hql)
						.setMaxResults(recordsPerPage)
						.setFirstResult(startRecordNo)
						.getResultList();
		return list;
	}


	@Override
	public int getTotalPageCount() {
		// 注意下一列敘述的每一個型態轉換
		int totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return totalPages;
	}

	public long getRecordCounts() {
		Long count = null; // 必須使用 long 型態		
		String hql = "SELECT count(*) FROM AdBean WHERE stock > 0 AND status = 1";
		Session session = factory.getCurrentSession();		
		count = (Long)session.createQuery(hql).getSingleResult();	
		return count;
	}

//---------------------------------------------------------
	//依照時間去判斷並且修改上架狀態
	@Override
	public void changeStatus() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String todayStr = sdf.format(date);
		java.sql.Date today = java.sql.Date.valueOf(todayStr);
		String hql = "UPDATE AdBean SET status = 0 WHERE adDate < :today OR stock = 0";
		
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("today", today).executeUpdate();
		System.out.println("檢查日期完成");
	}



	
	
	
}
