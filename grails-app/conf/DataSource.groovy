dataSource {
    pooled = true    
    driverClassName = "org.postgresql.Driver"
    username = "tomcat"    
    password = "tomcat00"
    
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
    dialect = 'org.hibernate.dialect.PostgreSQLDialect'
    show_sql = true
}

// environment specific settings
environments {
    development {
        dataSource {
            //dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            //url = "jdbc:h2:mem:devDb"
            dbCreate = "update" // one of 'create', 'create-drop','update'
            //url = 'jdbc:postgresql://localhost/ticket'
            url = 'jdbc:postgresql://localhost:5433/ticket'
        }
        hibernate {
            show_sql=false
        }
    }
    test {
        dataSource {
            //dbCreate = "update"
            //url = "jdbc:h2:mem:testDb"
        }
    }
    production {
        dataSource {
            //dbCreate = "update"
            //url = "jdbc:h2:prodDb"
            // For MySQL production scenarios enable the following settings
//          pooled = true
//          properties {
//               minEvictableIdleTimeMillis=1800000
//               timeBetweenEvictionRunsMillis=1800000
//               numTestsPerEvictionRun=3
//               testOnBorrow=true
//               testWhileIdle=true
//               testOnReturn=true
//               validationQuery="SELECT 1"
//          }
        }
    }
}
