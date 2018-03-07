package com.danrong.medex.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danrong.medex.configure.SessionField;
import com.danrong.medex.module.EmrDataMap;
import com.danrong.medex.module.MedicalRecordTableModule;
import com.danrong.medex.module.MedicalRecordTableModuleImpl;
import com.danrong.medex.util.AccountGenerater;
import com.danrong.medex.util.Help;
import com.danrong.medex.util.MedexToken;
import com.danrong.medex.util.ParamName;
import com.danrong.medex.util.SessionParser;
import com.danrong.medex.util.TokenGenerater;
import com.dr.core.util.StringUtils;

@Controller
public class MedicalTableController {

  @Value("#{properties['medex.web.host']}")
  public String mainUrl;

  @Value("#{properties['memr.host']}")
  public String serviceUri;

  private final MedexToken medexToken = new MedexToken();
  private final SessionParser sessionParser = new SessionParser();
  private final MedicalRecordTableModule medicalRecordTableModule = new MedicalRecordTableModuleImpl();

  /**
   * 获取表格列表页数据
   * 
   * @param request
   * @param medical_record_id
   * @return
   */
  @RequestMapping(value = "patient/list_medical_record_table.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String list_medical_record_table(HttpServletRequest request, String medical_record_id) {
    HashMap<String, Object> result = new HashMap<>();
    boolean status = true;
    if (StringUtils.isBlank(medical_record_id)) status = false;
    result.put(ParamName.STATUS, status);
    result.put(ParamName.DATA, medicalRecordTableModule.getRecordTableList(
        StringUtils.joinWithEmpty(serviceUri, ParamName.BASE_URI_SUFFIX), medical_record_id));
    return Help.amedex_result_2Json(result);
  }

  /**
   * 获取表格详情数据
   * 
   * @param request
   * @param record_id
   * @param table_id
   * @return
   */
  @RequestMapping(value = "patient/get_medical_record_table.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String get_medical_record_table(HttpServletRequest request, String record_id, String table_id) {
    HashMap<String, Object> result = new HashMap<>();
    EmrDataMap baseMap = new EmrDataMap();
    Object table_uri = baseMap.get(table_id);

    boolean status = true;
    if (table_uri == null || StringUtils.isBlank(record_id)) status = false;
    result.put(ParamName.STATUS, status);
    result.put(ParamName.DATA, medicalRecordTableModule.getRecordTableDetail(
        StringUtils.joinWithEmpty(serviceUri, (String) table_uri), record_id));
    return Help.amedex_result_2Json(result);
  }

  /**
   * 添加表格数据
   * 
   * @param request
   * @param response
   * @return
   */
  @SuppressWarnings({ "rawtypes", "unchecked" })
  @RequestMapping(value = "patient/add_medical_record_table.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String add_medical_record_table(HttpServletRequest request) {
    HashMap<String, Object> result = new HashMap<>();
    boolean status = true;
    String record_id = null;
    String table_name = null;
    String input_time = null;
    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = false;
    } else {
      EmrDataMap dataMap = new EmrDataMap(request, false);
      String table_id = request.getParameter(ParamName.TABLE_ID);
      if (StringUtils.isBlank(table_id)) status = false;
      else {
        dataMap.put(ParamName.URI, StringUtils.joinWithEmpty(serviceUri, (String) dataMap.get(table_id)));
        dataMap.put(ParamName.BASE_URI, StringUtils.joinWithEmpty(serviceUri, ParamName.BASE_URI_SUFFIX));

        status = medicalRecordTableModule.addRecordTable(dataMap);
        if (status) {
          HashMap<String, String> data = new HashMap<>();
          // 重置session
          String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
          sessionParser.setSession(request, SessionField.token, token);

          HashMap<String, Object> map = (HashMap) dataMap.get(ParamName.CORE);
          if (map != null) {
            record_id = (String) map.get(ParamName.record_id);
            table_name = (String) map.get(ParamName.table_name);
            input_time = (String) map.get(ParamName.input_time);
          }
          data.put(ParamName.TOKEN, token);
          data.put(ParamName.table_name, table_name);
          data.put(ParamName.record_id, record_id);
          data.put(ParamName.input_time, input_time);
          result.put(ParamName.DATA, data);
        }
      }
    }
    result.put(ParamName.STATUS, status);

    return Help.bean2Json(result);
  }

  /**
   * 更新
   * 
   * @param request
   * @return
   */
  @SuppressWarnings({ "unchecked", "rawtypes" })
  @RequestMapping(value = "patient/update_medical_record_table.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String update_medical_record_table(HttpServletRequest request) {
    HashMap<String, Object> result = new HashMap<>();
    boolean status = true;
    String record_id = null;
    String table_name = null;
    String input_time = null;
    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = false;
    } else {
      EmrDataMap dataMap = new EmrDataMap(request, true);
      String table_id = request.getParameter(ParamName.TABLE_ID);
      if (StringUtils.isBlank(table_id)) status = false;
      dataMap.put(ParamName.URI, StringUtils.joinWithEmpty(serviceUri, (String) dataMap.get(table_id)));

      status = medicalRecordTableModule.updateRecordTable(dataMap);
      if (status) {
        HashMap<String, String> data = new HashMap<>();
        // 重置session
        String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
        sessionParser.setSession(request, SessionField.token, token);

        HashMap<String, Object> map = (HashMap) dataMap.get(ParamName.CORE);
        if (map != null) {
          record_id = (String) map.get(ParamName.record_id);
          table_name = (String) map.get(ParamName.table_name);
          input_time = (String) map.get(ParamName.input_time);
        }
        data.put(ParamName.TOKEN, token);
        data.put(ParamName.table_name, table_name);
        data.put(ParamName.record_id, record_id);
        data.put(ParamName.input_time, input_time);
        result.put(ParamName.DATA, data);
      }
    }

    result.put(ParamName.STATUS, status);

    return Help.bean2Json(result);
  }

  /**
   * 删除
   * 
   * @param request
   * @param table_id
   * @param record_id
   * @return
   */
  @SuppressWarnings({ "unchecked", "rawtypes" })
  @RequestMapping(value = "patient/delete_medical_record_table.do", produces = "application/string; charset=utf-8")
  @ResponseBody
  public String delete_medical_record_table(HttpServletRequest request, String table_id, String record_id) {
    HashMap<String, Object> result = new HashMap<>();
    boolean status = true;
    String table_name = null;
    String input_time = null;
    // token 验证
    if (medexToken.matchToken(request) == MedexToken.code_mismatch) {
      status = false;
    } else {
      EmrDataMap baseMap = new EmrDataMap();
      Object table_uri = baseMap.get(table_id);

      if (table_uri == null || StringUtils.isBlank(record_id)) status = false;
      else {
        status = medicalRecordTableModule.removeRecordTable(serviceUri, (String) table_uri, record_id);
        if (status) {
          EmrDataMap dataMap = new EmrDataMap(request, true);
          HashMap<String, String> data = new HashMap<>();
          // 重置session
          String token = TokenGenerater.generateToken(AccountGenerater.generateHexString());
          sessionParser.setSession(request, SessionField.token, token);

          HashMap<String, Object> map = (HashMap) dataMap.get(ParamName.CORE);
          if (map != null) {
            record_id = (String) map.get(ParamName.record_id);
            table_name = (String) map.get(ParamName.table_name);
            input_time = (String) map.get(ParamName.input_time);
          }
          data.put(ParamName.TOKEN, token);
          data.put(ParamName.table_name, table_name);
          data.put(ParamName.record_id, record_id);
          data.put(ParamName.input_time, input_time);
          result.put(ParamName.DATA, data);
        }
      }
    }
    result.put(ParamName.STATUS, status);
    return Help.bean2Json(result);
  }
}
