package com.danrong.medex.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.servlet.ModelAndView;

import com.danrong.medex.configure.JSTLField;
import com.danrong.medex.configure.Status;
import com.danrong.medex.module.ImagesUpload;
import com.danrong.medex.util.Help;

@Controller
public class ImageUploadController {

  @Value("#{properties['medex.images.mainUrl']}")
  public String imagesUrl;
  @Value("#{properties['medex.web.host']}")
  public String mainUrl;

  // private final Logger logger = LoggerFactory.getLogger(ImageUploadController.class);

  @RequestMapping(value = "/fileUploadDemo")
  public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
    ModelAndView view = new ModelAndView();
    view.setViewName("fileUploadDemo");
    view.addObject(JSTLField.mainUrl, mainUrl.trim());
    view.addObject(JSTLField.imagesUrl, imagesUrl.trim());
    return view;
  }

  @RequestMapping(method = RequestMethod.GET, value = "__URL__/imageCut.do")
  public void get_imageCut(HttpServletRequest request, HttpServletResponse response) {
    PrintWriter out;
    try {
      out = response.getWriter();
      out.println("");
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  // @RequestMapping(method = RequestMethod.POST, value = "__URL__/imageCut.do")
  // public ModelAndView imageUpload(HttpServletRequest request, HttpServletResponse response,
  // @RequestParam("upd_image") MultipartFile file) {
  // ModelAndView view = new ModelAndView();
  // view.addObject(JSTLField.mainUrl, mainUrl.trim());
  // view.addObject(JSTLField.imagesUrl, imagesUrl.trim());
  // String fileName = "";
  // boolean succeed = true;
  // if (StringUtils.isNotBlank(file.getOriginalFilename())) {
  // fileName += imagesUrl + ImagesUpload.getInstance().upload(file);
  // if (StringUtils.isBlank(fileName)) succeed = false;
  // }
  // if (succeed) {
  // view.addObject("fileName", fileName);
  // view.setViewName("imageUploadSuccess");
  // } else {
  // view.setViewName("imageUploadFailed");
  // }
  // System.out.println(fileName);
  // return view;
  // }

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

  @RequestMapping(method = RequestMethod.POST, value = "/appimageCut.do")
  @ResponseBody
  public String imageupload(HttpServletRequest request, HttpServletResponse response,
      @RequestParam("upd_image") MultipartFile[] files) {
    if (files == null) return "";
    String fileName = "";
    for (MultipartFile file : files) {
      fileName += imagesUrl + ImagesUpload.getInstance().upload(file) + ",";
    }
    System.out.println(fileName);
    return fileName;
  }
}
