package CR.dao.impl;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.NonUniqueResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import CR.dao.CR_Dao;
import CR.model.CRBean;
import CR.model.CRemployee;
import iiiNews.MB.model.MBBean;

@Repository
public class CR_Dao_impl implements CR_Dao {

	@Autowired
	SessionFactory factory;
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CRBean> getRecord() {
		String hql ="FROM CRBean";
		Session session=factory.getCurrentSession();		
		return session.createQuery(hql).getResultList();
	}

	@Override
	public void addReport(CRBean report) {
		Session session=factory.getCurrentSession();
		MBBean mb = getMembersByMemberId(report.getMemberId());
		CRemployee crb = getemployeeBytreatamt();
		Timestamp date=new Timestamp(System.currentTimeMillis());
		report.setCrApplyDate(date);
		report.setState("未回覆");
		report.setMbBean(mb);
		report.setCremployee(crb);
		session.save(report);
		
	}


	@Override
	public MBBean getMemberById(int memberId) {
		Session session=factory.getCurrentSession();
		return session.get(MBBean.class, memberId);
	}

	@Override
	public void deleteReportByPk(int pk) {
		Session session = factory.getCurrentSession();
		CRBean cb = new CRBean(); 
		cb.setPk(pk);
		session.delete(cb);
	}

	@Override
	public CRBean getReportById(int pk) {
		Session session = factory.getCurrentSession();
		String hql ="FROM CRBean WHERE pk = :pk";
		CRBean cb = null;
		try {
			cb =(CRBean) session.createQuery(hql)
					.setParameter("pk", pk)
					.getSingleResult();
		}catch(NonUniqueResultException e) {
			e.printStackTrace();
		}
		return cb;
	}

	@Override
	public void updateReport(CRBean report) {
		Session session=factory.getCurrentSession();
		session.update(report);		
		
	}

	@Override
	public void evictReport(CRBean cb) {
		Session session = factory.getCurrentSession();
		session.evict(cb);		
	}
	
	@Override
	public MBBean getMembersByMemberId(String memberId) {
		Session session=factory.getCurrentSession();
		MBBean mb=null;
		String hql ="FROM MBBean WHERE memberId = :mId";
		try {
			mb =(MBBean) session.createQuery(hql)
					.setParameter("mId", memberId)
					.getSingleResult();

		}catch(NonUniqueResultException e) {
			e.printStackTrace();
		}
		return mb;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CRBean> getReportBymemberId(String memberId) {
		Session session=factory.getCurrentSession();
		String hql ="FROM CRBean where memberId=:mId";
		return session.createQuery(hql).setParameter("mId", memberId).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CRBean> getReportByStatus(String status) {
		Session session=factory.getCurrentSession();
		String hql ="FROM CRBean WHERE status = :status";
		return session.createQuery(hql).setParameter("status", status).getResultList();
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public CRemployee getemployeeBytreatamt() {
		Session session=factory.getCurrentSession();
		String hql ="FROM CRemployee ORDER BY untreatamt ASC";
		
		CRemployee list =(CRemployee) session.createQuery(hql).setMaxResults(1).getSingleResult();
		System.out.println(list);
		System.out.println("hql2="+list.getUntreatamt());
		String hql2 ="UPDATE CRemployee SET untreatamt=:unamt Where empPk=:pk";
		session.createQuery(hql2).setParameter("unamt", list.getUntreatamt()+1)
								.setParameter("pk", list.getEmpPk()).executeUpdate();
		
		return list;
	}
	
}
