title=DevOps with Maven on WAR project
author=Pablo Palazón
date=2013-01-24
type=post
tags=devops, maven, war, java, artifact, classifier
status=published
comments=true
~~~~~~

I'd like to let you an Maven snippet code for configure WAR project for
different environments. Sometimes, we're developing in a dev
environment, but this project we'd like to run in another environments
(cloud, server, etc).

This is a configuration profile

    <profile>
        <id>prog</id>
        <activation>
            <activeByDefault>true</activeByDefault>
        </activation>
        <properties>
            <!-- There are 3 availabled (dev,nuvol,nuvolbeta), ie: mvn
                clean package -Dprofile=nuvol -->
            <env>dev</env>
        </properties>
        <build>
            <resources>
                <resource>
                    <directory>src/main/resources/common</directory>
                </resource>
                <resource>
                    <directory>src/main/resources/${env}</directory>
                </resource>
            </resources>
            <plugins>
                <plugin>
                    <artifactId>maven-war-plugin</artifactId>
                    <version>2.2</version>
                    <configuration>
                        <classifier>${env}</classifier>
                        <webResources>
                            <resource>
                                <directory>src/main/webinf/common</directory>
                                <targetPath>WEB-INF</targetPath>
                                <includes>
                                    <include>**/*</include>
                                </includes>
                            </resource>
                            <resource>
                                <directory>src/main/webinf/${env}</directory>
                                <targetPath>WEB-INF</targetPath>
                                <includes>
                                    <include>**/*</include>
                                </includes>
                            </resource>
                        </webResources>
                    </configuration>
                </plugin>
            </plugins>
        </build>
    </profile>

Features:

 * Profile active by default (mvn clean package, will use dev environment)
 * Change environment variable with -Denv=dev (java runtime option)
 * All WEB-INF will be on src/main/webinf/
   * common: WEB-INF common files for all environment (DRY) : (Mandatory)
   * dev: WEB-INF files for dev environment : (Mandatory)
   * another_env_name: WEB-INF files for any environment if you want : (Optional)
 * All resources files (java resources) on src/main/resources
   * Same philosophy than WEB-INF configuration folder

Caution:

 * This will ignore WEB-INF file on webapp/WEB-INF
 * If you want to import this project on Eclipse, you will add WEB-INF by han. (Project Properties->Deployment Assembly)
