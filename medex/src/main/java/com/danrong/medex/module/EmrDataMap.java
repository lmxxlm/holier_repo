package com.danrong.medex.module;

import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import com.danrong.medex.util.ParamName;
import com.dr.core.util.MD5;
import com.dr.core.util.StringUtils;
import com.dr.core.util.TimeUtil;

public class EmrDataMap extends HashMap<String, Object> {

  private static final long serialVersionUID = -6782930898181703733L;
  private TimeUtil timeUtil = new TimeUtil();

  public EmrDataMap() {
    readFromFile("type_resources.properties");
  }

  public EmrDataMap(HttpServletRequest request, boolean update) {
    this.put(ParamName.CORE, getParameterMap(request, update));
    readFromFile("type_resources.properties");
  }

  @SuppressWarnings({ "rawtypes", "unchecked" })
  private Map getParameterMap(HttpServletRequest request, boolean update) {
    Map properties = request.getParameterMap();
    Map result = new HashMap<>();
    Iterator entries = properties.entrySet().iterator();
    Map.Entry entry;
    String name = "";
    String value = "";
    while (entries.hasNext()) {
      entry = (Map.Entry) entries.next();
      name = (String) entry.getKey();
      Object valueObj = entry.getValue();
      if (null == valueObj) {
        value = "";
      } else if (valueObj instanceof String[]) {
        String[] values = (String[]) valueObj;
        for (int i = 0; i < values.length; i++) {
          value = values[i] + ",";
        }
        value = value.substring(0, value.length() - 1);
      } else {
        value = valueObj.toString();
      }
      result.put(name, value);
    }

    result.remove(ParamName.TOKEN);

    if (!update) {
      String record_id = get_record_id(result);
      result.put(ParamName.record_id, record_id);
      result.put(ParamName.input_time, timeUtil.now2s());
    } else {
      result.put(ParamName.UPDATE_TIME, timeUtil.now2s());
    }
    return result;
  }

  @SuppressWarnings("rawtypes")
  private String get_record_id(Map result) {
    return MD5.md5(StringUtils.joinWithEmpty(result.get(ParamName.medical_record_id).toString(),
        result.get(ParamName.table_id).toString(), timeUtil.now2s()));
  }

  private void readFromFile(String fileName) {
    try {
      InputStream in = this.getClass().getClassLoader().getResourceAsStream(fileName);
      Properties properties = new Properties();
      properties.load(in);

      Enumeration<?> enu = properties.propertyNames();
      while (enu.hasMoreElements()) {
        String key = (String) enu.nextElement();
        String value = properties.getProperty(key);

        this.put(key, value);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
