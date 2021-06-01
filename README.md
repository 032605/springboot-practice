# springboot-practice
spring boot with MariaDB

# Spring Boot 개발 환경 <https://merry1031.tistory.com/4>
JDK (JAVA 8), STS, MariaDB

# 개발 중 참고 사항 
### 1. Service(Interface)와 ServiceImpl(Class)를 분리하는 이유 
: 객체지향 프로그래밍에서는 클래스를 작게 나누어 다른 클래스와 의존관계를 낮추는것이 중요 (즉, 결합도를 낮추는것. 유지보수 용이)
#### ***Controller에서 ServiceImpl를 참조해야하며, Service가 아닌 ServiceImpl에 @Service 어노테이션을 적어주어야함***

### 2. Maven/Gradle -> Update Project

### 3. Configuration.java
: Eclipse(STS)를 통해 생성하는 'Spring Legacy project'의 경우 XML으로 스프링 관련 설정
Spring 버전 3 이후 JAVA 클래스 파일을 이용한 설정 지원 > Java 활용 설정 증가

→ web.xml의 파일 삭제 및 스프링 관련 파일 삭제 (web.xml + servlet-context.xml + root--context.xml)
→ pom.xml의 수정 및 스프링 버전 변경 

~~~ xml
 <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-war-plugin</artifactId>
                <version>3.2.0</version>
                <configuration>
                   <failOnMissingWebXml>false</failOnMissingWebXml>
                </configuration>
</plugin>

~~~


→ JAVA 설정 관련 패키지 생성 (Configuration.java)


~~~ java

package com.hustar.value_coding_boot.configuration;


import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;


@Configuration  //스프링은 @Configuration이 지정된 클래스를 자바 기반의 설정 파일로 인식합니다.
@PropertySource("classpath:/application.properties") //	해당 클래스에서 참조할 properties 파일의 위치를 지정
public class DatabaseConfiguration {

  // 바로 위! application.properties에 설정했던 데이터베이스 관련 정보를 사용하도록 지정한다.
 	//@ConfigurationProperties 어노테이션에 prefix가 spring.datasource.hikari로 설정되었기 때문에 
	//spring.datasource.hikari로 시작하는 설정을 이용해서 히카리CP의 설정파일을 만든다.
    @Bean
    @ConfigurationProperties(prefix="spring.datasource.hikari") //해당 애너테이션은 인자에 prefix 속성을 지정
    public HikariConfig hikariConfig() {
        return new HikariConfig();
    }
    

    // DataSource : 데이터 소스 객체를 생성
    @Bean
    public DataSource dataSource() throws Exception {
        DataSource dataSource = new HikariDataSource(hikariConfig());
        System.out.println(dataSource.toString());
        return dataSource;
    }
    
    @Autowired   //bean 객체 생성 및 관리 (beanfactory를 상속)
    public ApplicationContext applicationContext;
    
    
    @Bean
    @ConfigurationProperties(prefix = "mybatis.configuration")  //@ConfigurationProperties을 통해서 application.properties에서 prefix가 mybatis.configuration인 설정을 가져온다.
    public org.apache.ibatis.session.Configuration mybatisConfig(){
        return new org.apache.ibatis.session.Configuration();   //가져온 마이바티스 설정을 자바 클래스로 만들어 반환한다.
    }

    
    @Bean  //MyBatis에서 Sql Session 생성한다. SqlSessionFactory는 데이터베이스 연결과 SQL 실행에 대한 모든 것을 한다. SqlSessionFactory를 생성해주는 객체는 SqlSessionFactoryBean이다.
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
    	SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
    	sqlSessionFactoryBean.setDataSource(dataSource);
    	sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:/mapper/**/*.xml"));     // ** 하위 폴더 xml 파일 전체 
    	sqlSessionFactoryBean.setConfiguration(mybatisConfig());
    	return sqlSessionFactoryBean.getObject();
    }
    

    @Bean    //SqlSession을 구현하고 코드에서 SqlSession을 대체하는 역할, 여러 개의 DAO나 Mapper에서 공유할 수 있다.
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {		//SqlSessionTemplate은 SqlSession을 구현하고 코드에서 SqlSession를 대체하는 역할을 한다.
        return new SqlSessionTemplate(sqlSessionFactory);
    }
    
}
~~~

