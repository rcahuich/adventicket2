dataSource {
    pooled = true    
    driverClassName = "org.postgresql.Driver"
    username = "tomcat"    
    password = "tomcat00"
}

hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            //url = 'jdbc:postgresql://localhost/ticket'
            url = 'jdbc:postgresql://localhost:5432/ticket'
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
