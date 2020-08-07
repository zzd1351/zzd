package com.zzd.service;

import com.zzd.beans.Meet;
import com.zzd.dao.MeetDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author:Snake
 * @description: service实现类
 * @time: 2020/8/79:03
 */
@Service
public class MeetServiceImpl implements MeetService {
    @Resource
    private MeetDao meetDao;
    @Override
    public List<Map> list(Map<String, Object> map) {
        return meetDao.list(map);
    }

    @Override
    public List<Map> selectType() {
        return meetDao.selectType();
    }

    @Override
    public List<Map> selectServer() {
        return meetDao.selectServer();
    }

    @Override
    public int insertMeet(Meet meet, String[] split) {
        int i = 0;
        meetDao.insertMeet(meet);
        if (split.length > 0){
            Map<String, Object> map = new HashMap(10);
            map.put("mid",meet.getId());
            map.put("sid",split);
            i = meetDao.insertMid(map);
        }
        return i;
    }

    @Override
    public Integer deleteMeet(Integer id) {
        meetDao.deleteMeet(id);
        Integer i = meetDao.deleteMid(id);
        return i;
    }

    @Override
    public int update(Meet meet, String[] split) {
        meetDao.updateMeet(meet);
        meetDao.deleteMid(meet.getId());
        int i = 0;
        if (split.length > 0){
            Map<String, Object> map = new HashMap(10);
            map.put("mid",meet.getId());
            map.put("sid",split);
            i = meetDao.insertMid(map);
        }
        return i;
    }

    @Override
    public Map selectOne(Integer id) {
        return meetDao.selectOne(id);
    }
}
