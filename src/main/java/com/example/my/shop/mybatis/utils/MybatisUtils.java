package com.example.my.shop.mybatis.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;

public class MybatisUtils {
    private static SqlSessionFactory sqlSessionFactory;

    private MybatisUtils() {
    }

    static {
        String resource = "MybatisConfig.xml";
        try {
            //读取配置文件 获取sqlsessionFactory
            InputStream inputStream = Resources.getResourceAsStream(resource);
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
           /* Configuration configuration = sqlSessionFactory.getConfiguration();
            System.out.println(String.format("configuration: %s ",configuration));

            Environment environment = configuration.getEnvironment();
            System.out.println(String.format("environment: %s ",environment));

            DataSource dataSource = environment.getDataSource();
            System.out.println(String.format("dataSource: %s ",dataSource));*/

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取sqlSession
     *
     * @return
     */
    public static SqlSession getSqlSession() {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        return sqlSession;
    }

}
