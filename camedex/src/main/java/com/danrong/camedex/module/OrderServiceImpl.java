package com.danrong.camedex.module;

import org.apache.commons.lang.StringUtils;

import com.danrong.medex.bean.SearchParams;
import com.danrong.medex.bean.result.OrderResultObject;
import com.danrong.medex.configure.TableFieldName;
import com.danrong.medex.module.OrderModule;
import com.danrong.medex.module.OrderModuleImpl;
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

public class OrderServiceImpl implements OrderService {

  private OrderModule orderModule;

  public OrderServiceImpl() {
    this.orderModule = new OrderModuleImpl();
  }

  @Override
  public OrderResultObject get_order_list_by_status(SearchParams param, String status, String caId) {
    DBObject query = new BasicDBObject();
    if (StringUtils.isNotBlank(status)) query.put(TableFieldName.status, status);
    if (StringUtils.isNotBlank(caId)) query.put(TableFieldName.caId, caId);
    return orderModule.get_user_order_list(param, query, true);
  }

}
