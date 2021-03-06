package CR.dao;

import java.util.List;

import CR.model.CRBean;
import CR.model.CRemployee;
import iiiNews.MB.model.CpMemberBean;
import iiiNews.MB.model.MBBean;

public interface CR_Dao {
	
	public List<CRBean> getRecord();

	public MBBean getMemberById(int memberId);

	void addReport(CRBean report);
	
	CRBean getReportById(int pk);
	
	void deleteReportByPk(int pk);
	
	void updateReport(CRBean cb);
	
	void updateScoreOnReport(CRBean cb);
	
	void evictReport(CRBean cb);
	
	public MBBean getMembersByMemberId(String memberId);
	
	public  List<CRBean> getReportBymemberId(String memberId);
	
	public List<CRBean> getReportByStatus(String status);
	
	public CRemployee getemployeeBytreatamt();

	CpMemberBean getCpMembersByMemberId(String memberId);

	List<CRBean> getReportBycpmemberId(String memberId);

	void reviseemp(CRBean report);

	void addcpReport(CRBean report);
	
	
}
