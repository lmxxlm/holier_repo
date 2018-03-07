package com.danrong.medex.module;

import java.io.IOException;
import java.util.HashMap;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.danrong.medex.util.MedicalRecordTableHelp;
import com.danrong.medex.util.ParamName;
import com.dr.core.util.StringUtils;
import com.fasterxml.jackson.jaxrs.json.JacksonJsonProvider;

public class MedicalRecordTableModuleImpl implements MedicalRecordTableModule {

  @SuppressWarnings({ "rawtypes", "unchecked" })
  @Override
  public boolean addRecordTable(EmrDataMap data) {
    HashMap<String, Object> map = (HashMap) data.get(ParamName.CORE);
    if (addBaseRecord(map, data.get(ParamName.BASE_URI).toString())) {
      for (String key : map.keySet()) {
        System.out.println(key + "#" + map.get(key));
      }
      try {
        Client client = ClientBuilder.newClient().register(JacksonJsonProvider.class);
        WebTarget target = client.target((String) data.get(ParamName.URI));
        Response response = target.request().buildPost(Entity.entity(map, MediaType.APPLICATION_JSON)).invoke();
        Boolean value = response.readEntity(Boolean.class);
        response.close();
        return value;
      } catch (Exception e) {
        e.printStackTrace();
        removeBaseRecord(data.get(ParamName.BASE_URI).toString(), (String) map.get(ParamName.record_id));
        return false;
      }
    } else {
      return false;
    }
  }

  private boolean addBaseRecord(HashMap<String, Object> data, String base_uri) {
    Client client = ClientBuilder.newClient().register(JacksonJsonProvider.class);
    WebTarget target = client.target(base_uri);
    Response response = target.request()
        .buildPost(Entity.entity(MedicalRecordTableHelp.buildBaseRecord(data), MediaType.APPLICATION_JSON)).invoke();
    Boolean value = response.readEntity(Boolean.class);
    response.close();
    return value;
  }

  @Override
  public void removeBaseRecord(String base_uri, String base_record_id) {
    Client client = ClientBuilder.newClient().register(JacksonJsonProvider.class);
    WebTarget target = client.target(base_uri + "/" + base_record_id);
    Response response = target.request().delete();
    response.readEntity(Boolean.class);
    response.close();
  }

  @Override
  public String getRecordTableList(String uri, String medical_record_id) {
    Client client = ClientBuilder.newClient().register(JacksonJsonProvider.class);
    WebTarget target = client.target(uri + "/" + medical_record_id);
    Response response = target.request().get();
    String result = response.readEntity(String.class);
    response.close();
    return result;
  }

  @Override
  public String getRecordTableDetail(String uri, String record_id) {
    Client client = ClientBuilder.newClient().register(JacksonJsonProvider.class);
    WebTarget target = client.target(uri + ParamName.RECORD_DETAIL_SUFFIX + record_id);
    Response response = target.request().get();
    String result = response.readEntity(String.class);
    response.close();
    return result;
  }

  @Override
  public boolean removeRecordTable(String server_uri, String table_uri, String record_id) {
    try {
      removeBaseRecord(StringUtils.joinWithEmpty(server_uri, ParamName.BASE_URI_SUFFIX), record_id);
      Client client = ClientBuilder.newClient().register(JacksonJsonProvider.class);
      WebTarget target = client.target(StringUtils.joinWithEmpty(server_uri, table_uri, "/", record_id));
      Response response = target.request().delete();
      response.readEntity(Boolean.class);
      response.close();
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
    return true;
  }

  public static void main(String[] args) throws IOException {
    // HashMap<String, String> data = new HashMap<>();
    // BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream("D:/bl1.txt")));
    // String line = "";
    // while ((line = reader.readLine()) != null) {
    // if (line.contains("#")) {
    // String[] arr = line.split("#");
    // if (arr.length == 1) data.put(arr[0], "");
    // else data.put(arr[0], arr[1]);
    // }
    // }
    // System.out.println(data.size());
    // reader.close();
    //
    // Client client = ClientBuilder.newClient().register(JacksonJsonProvider.class);
    // WebTarget target = client.target("http://127.0.0.1:8081/memr/followup_guke");
    // Response response = target.request().buildPost(Entity.entity(data, MediaType.APPLICATION_JSON)).invoke();
    // System.out.println(response.getStatus());
    // Boolean value = response.readEntity(Boolean.class);
    // System.out.println(value);
    // response.close();

  }

  @SuppressWarnings({ "rawtypes", "unchecked" })
  @Override
  public boolean updateRecordTable(EmrDataMap data) {
    HashMap<String, Object> map = (HashMap) data.get(ParamName.CORE);
    try {
      Client client = ClientBuilder.newClient().register(JacksonJsonProvider.class);
      WebTarget target = client.target((String) data.get(ParamName.URI));
      Response response = target.request().buildPut(Entity.entity(map, MediaType.APPLICATION_JSON)).invoke();
      Boolean value = response.readEntity(Boolean.class);
      response.close();
      return value;
    } catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }

}
