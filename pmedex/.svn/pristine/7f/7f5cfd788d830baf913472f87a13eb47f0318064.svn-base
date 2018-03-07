package com.danrong.pmedex.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.danrong.medex.configure.Status;
import com.danrong.medex.module.ImagesUpload;
import com.danrong.medex.util.Help;

@Controller
public class ImageUploadController {

  @Value("#{properties['pmedex.images.url']}")
  public String imagesUrl;
  @Value("#{properties['pmedex.web.host']}")
  public String mainUrl;

  @RequestMapping(method = RequestMethod.POST, value = "__URL__/imageCut.do")
  @ResponseBody
  public String imageupload(HttpServletRequest request, HttpServletResponse response,
      @RequestParam("upd_image") MultipartFile file) {
    Map<String, Object> result = new HashMap<>();
    Map<String, Object> filedata = new HashMap<>();
    int listId = Integer.parseInt(request.getParameter("listId"));
    boolean succeed = true;
    if (StringUtils.isNotBlank(file.getOriginalFilename())) {
      Map<String, String> fileNames = ImagesUpload.getInstance().uploadAndScale(file);
      if (fileNames == null || fileNames.isEmpty()) succeed = false;
      else {
        for (String key : fileNames.keySet())
          filedata.put(key, imagesUrl + fileNames.get(key));
      }
    }
    filedata.put("listId", listId);
    result.put("data", filedata);
    if (succeed) {
      result.put("status", Status.STATUS_OK);
    } else {
      result.put("status", Status.STATUS_ERROR);
    }
    return Help.bean2Json(result);
  }

}
