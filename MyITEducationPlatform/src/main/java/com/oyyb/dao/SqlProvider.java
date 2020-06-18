package com.oyyb.dao;

import java.util.Map;

public class SqlProvider {
    public String selectCourseByLabelIdAndCategory(Map<String, Object> map){
        String sql="select * from course where 1=1";
        Object category=  map.get("category");
        Object label_name=map.get("label_name");
        Object courseOrder=map.get("courseOrder");
        if(category!=null && !"".equals(category)){
            System.out.println(1);
            sql+=" and category=#{category}";
        }
        if(label_name!=null && !"".equals(label_name)){
            System.out.println(2);
            sql+=" and label_id=(select id from label where name=#{label_name})";
        }
        if ("最新".equals(courseOrder)){
            System.out.println(3);
            sql+=" order by classstart desc";
        }
        if ("最热".equals(courseOrder)){
            System.out.println(4);
            sql+=" order by studys  desc";
        }

        return sql;
    }

    public String selectQuestionByDiscuss(Map<String,Object> map){
        String sql="select * from question_course where 1=1 ";
        Object discuss=map.get("discuss");
        Object orderWay=map.get("orderWay");
        if (discuss!=null && (Integer)discuss!=0){
            sql+=" and discuss=#{discuss} ";
        }
        if("最新".equals(orderWay) || orderWay==null){
            sql+=" order by pubdate";
        }
        if("最热".equals(orderWay)){
            sql+=" order by visited";
        }
        return sql;
    }

    public String findStudyByUserid(Map<String,Object> map){
        String sql="";
        String c= (String) map.get("catagory");
        if(c!=null && c.equals("study")){
            sql="select * from course where id in(select course_id from study_course where users_id=#{users_id}) ";

        }
        if(c!=null && c.equals("attention")){
            sql="select * from course where id in(select course_id from attention_course where users_id=#{users_id}) ";

        }
        if(c!=null && c.equals("studied")){
            sql="select * from course where id in(select course_id from mycourses where users_id=#{users_id})";
        }
        if(c!=null && c.equals("publish")){
            sql="select * from  course where teacher_id=#{users_id}";
        }
        return sql;
    }
}
