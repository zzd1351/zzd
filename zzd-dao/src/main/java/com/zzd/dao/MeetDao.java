package com.zzd.dao;

import com.zzd.beans.Meet;

import java.util.List;
import java.util.Map;

/**
 * @author:Snake
 * @description: dao层接口
 * @time: 2020/08/07
 */
public interface MeetDao {
    /**
     * 列表
     * @param map 模糊的条件
     * @return 信息详情
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
     */
    void insertMeet(Meet meet);

    /**
     * 添加会议服务
     * @param map 服务信息
     * @return 是否成功
     */
    int insertMid(Map<String, Object> map);

    /**
     * 删除会议
     * @param id 会议编号
     */
    void deleteMeet(Integer id);

    /**
     * 删除会议相关服务
     * @param id 会议编号
     * @return 结果
     */
    Integer deleteMid(Integer id);

    /**
     * 修改会议信息
     * @param meet 会议信息
     */
    void updateMeet(Meet meet);

    /**
     * 会议信息回显
     * @param id 会议编号
     * @return 会议信息
     */
    Map selectOne(Integer id);
}
