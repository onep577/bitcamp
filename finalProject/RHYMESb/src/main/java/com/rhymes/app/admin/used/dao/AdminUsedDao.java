package com.rhymes.app.admin.used.dao;

import java.util.List;

import com.rhymes.app.admin.used.model.AdminBbsParam;
import com.rhymes.app.admin.used.model.AdminBlParam;
import com.rhymes.app.admin.used.model.AdminSParam;
import com.rhymes.app.used.model.BlacklistDto;
import com.rhymes.app.used.model.ProductsDto;

public interface AdminUsedDao {

	List<ProductsDto> getAdminUsedlist(AdminBbsParam adparam);

	int getAdminBbsCount(AdminBbsParam adparam);

	List<BlacklistDto> getAdminBlacklist(AdminBlParam blparam);

	int getAdminBlCount(AdminBlParam blparam);

	boolean AdminBanCount(String string);

	boolean AdminBanReview(int n);

	boolean AdminBanCancel(int n2);

	int getAdminSellerCount(AdminSParam sparam);

	List<BlacklistDto> getAdminSellerlist(AdminSParam sparam);

	boolean AdminUserLock(String string);

	boolean AdminUserUnLock(String string);

}
