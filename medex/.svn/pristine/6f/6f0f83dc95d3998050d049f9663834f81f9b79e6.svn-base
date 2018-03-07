package com.danrong.medex.module;

public interface MedicalRecordTableModule {

  /**
   * 根据病历记录id获取对应的病历表格
   * 
   * @param sp
   * @param medical_record_id
   * @return
   */
  public String getRecordTableList(String uri, String medical_record_id);

  /**
   * 根据record_id和table_id获取表格详情
   * 
   * @param record_id
   * @param uri
   * @return
   */
  public String getRecordTableDetail(String uri, String record_id);

  /**
   * 添加电子病历表格
   * 
   * @param data
   * @return
   */
  public boolean addRecordTable(EmrDataMap data);

  /**
   * 更新电子病历表格
   * 
   * @param data
   * @return
   */
  public boolean updateRecordTable(EmrDataMap data);

  /**
   * 删除病历表格记录
   * 
   * @param uri
   * @param record_id
   * @return
   */
  public boolean removeRecordTable(String server_uri, String table_uri, String record_id);

  /**
   * 表格数据索引表删除记录
   * 
   * @param base_record_id
   * @param base_uri
   * @return
   */
  public void removeBaseRecord(String base_uri, String base_record_id);
}
