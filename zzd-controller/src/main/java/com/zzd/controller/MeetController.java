package com.zzd.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zzd.beans.Meet;
import com.zzd.service.MeetService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author:Snake
 * @description: 控制层
 * @time: 2020/8/79:01
 */
@Controller
public class MeetController {
    @Resource
    private MeetService meetService;

    @RequestMapping("list")
    public String list(Model model, @RequestParam(value = "cpage",defaultValue = "1")Integer cpage,String name, Integer type, String startTime, String endTime){
        Map<String, Object> map = new HashMap<>(10);
        map.put("name",name);
        map.put("type",type);
        map.put("startTime",startTime);
        map.put("endTime",endTime);
        PageHelper.startPage(cpage,3);
        List<Map> list = meetService.list(map);
        PageInfo pi = new PageInfo<>(list);
        model.addAttribute("list",list);
        model.addAttribute("map",map);
        model.addAttribute("pi",pi);
        return "list";
    }
    @RequestMapping("selectType")
    @ResponseBody
    public Object selectType(){
        return meetService.selectType();
    }
    @RequestMapping("selectServer")
    @ResponseBody
    public Object selectServer(){
        return meetService.selectServer();
    }
    @RequestMapping("toAdd")
    public String toAdd(){
        return "insertMeet";
    }
    @RequestMapping("insertMeet")
    public String insertMeet(Meet meet, String sid){
        System.out.println(sid);
        String[] split = null;
        if (sid != null){
            split = sid.split(",");
        }
        int i = meetService.insertMeet(meet,split);
        return "redirect:list";
    }
    @RequestMapping("deleteMeet")
    @ResponseBody
    public Integer deleteMeet(Integer id){
        return meetService.deleteMeet(id);
    }
    @RequestMapping("toUpd")
    public String toUpd(){
        return "updateMeet";
    }
    @RequestMapping("updateMeet")
    @ResponseBody
    public int updateMeet(Meet meet, String sid){
        String[] split = null;
        if (sid != null){
            split = sid.split(",");
        }
        int i = meetService.update(meet,split);
        return i;
    }
    @RequestMapping("selectOne")
    @ResponseBody
    public Object selectOne(Integer id){
        return meetService.selectOne(id);
    }
}
