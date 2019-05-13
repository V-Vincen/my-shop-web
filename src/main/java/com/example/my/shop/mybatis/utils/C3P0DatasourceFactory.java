package com.example.my.shop.mybatis.utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.ibatis.datasource.unpooled.UnpooledDataSourceFactory;

/** Mybatis 没有帮开发者实现 c3p0 数据库连接池，
 * 故需要使用者自己实现 c3p0 来加载数据连接池
 * 。其实很简单的，只要继承 UnpooledDataSourceFactory 并把 dataSource 实现。
 * 我们的 mybatis 就实现了 c3p0 数据库连接池。*/
public class C3P0DatasourceFactory  extends UnpooledDataSourceFactory {
    public C3P0DatasourceFactory() {
        this.dataSource=new ComboPooledDataSource();
    }
}
