package iiiNews.AD.service;

import java.util.List;

import iiiNews.AD.model.AdOrderItemBean;

public interface AdItemService {
	
	public List<AdOrderItemBean> getItemsInOneOrder(int adOrderPk);
	
	public AdOrderItemBean getOneItems(int itemPk);
	
	public int updateItemPic(AdOrderItemBean aoib);
	
	public List<AdOrderItemBean> getCpMemberSoldList(String memberId);
}
