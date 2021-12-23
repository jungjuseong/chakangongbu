server.port: 9000
spring.application.name: chakgong

# Datasource configuration
spring.datasource:
  name: ecomm
  url: jdbc:h2:mem:ecomm;DB_CLOSE_DELAY=-1;IGNORECASE=TRUE;DATABASE_TO_UPPER=false
  driverClassName: org.h2.Driver
  username: sa
  password:

# H2 configuration
spring.h2.console:
  enabled: true
  settings.web-allow-others: false

# JPA configuration
spring.jpa:
  properties.hibernate.default_schema: ecomm
  database-platform: org.hibernate.dialect.H2Dialect
  show-sql: true
  format_sql: true
  generate-ddl: false
  hibernate.ddl-auto: none

# Flyway configuration
spring.flyway:
  url: jdbc:h2:mem:ecomm
  schemas: ecomm
  user: sa
  password:

# Security configuration
# Keystore/keys generated using JDK have validity of three months.
# Before using this code make sure to generate a new keys
# update these values accordingly.
app.security.jwt:
  keystore-location: jwt-keystore.jks
  keystore-password: password
  key-alias: jwt-sign-key
  private-key-passphrase: password