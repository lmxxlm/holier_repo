package com.danrong.camedex.module;

import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.OrderResultObject;

public interface OrderService {

  public OrderResultObject get_order_list_by_status(SearchParams param, String status, String role_id);
}
