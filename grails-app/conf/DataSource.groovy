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
            
        }
    }
    production {
        dataSource {
            dbCreate = 'update'
            url = 'jdbc:postgresql://rigel.um.edu.mx/adventicket'
        }
    }
}
