package com.zzd.service;

import com.zzd.beans.Meet;

import java.util.List;
import java.util.Map;

/**
 * @author:Snake
 * @description: service接口
 * @time: 2020-08-07
 */
public interface MeetService {
    /**
     * 查询列表
     * @param map 模糊的条件
     * @return 数据详情
     */
    List<Map> list(Map<String, Object> map);

    /**
     * 会议类型
     * @return 结果集
     */
    List<Map> selectType();

    /**
     * 会议服务
     * @return 结果集
     */
    List<Map> selectServer();

    /**
     * 添加会议
     * @param meet 会议信息
     * @param split 会议服务
     * @return 是否成功
     */
    int insertMeet(Meet meet, String[] split);

    /**
     * 删除会议
     * @param id 会议id
     * @return 删除结果
     */
    Integer deleteMeet(Integer id);

    /**
     * 修改会议信息
     * @param meet 会议信息
     * @param split 会议服务
     * @return 结果
     */
    int update(Meet meet, String[] split);

    /**
     * 会议信息回显
     * @param id 会议编号
     * @return 会议信息
     */
    Map selectOne(Integer id);
}
