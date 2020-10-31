package iiiNews.MT.dao;

import java.util.List;

import iiiNews.MT.model.MtAddBean;

public interface MtAddDao {

	public int saveMtAddDao(MtAddBean mtAddBean);

	public List<MtAddBean> getAllMtAdd();

	public MtAddBean getLastRecord();

	public MtAddBean getArticleById(String articleId);
	
//	public List<String> getAllAddDao1();	//抓pkey
	
}
