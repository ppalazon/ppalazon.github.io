title=DevOps configuration for java
author=Pablo Palazón
date=2013-01-25
type=post
tags=devops, java, configuration, commons-configuration, commons, apacher
status=published
comments=true
~~~~~~

Sometimes, we're developing applications that need some run-time
configuration. Those configurations depends of run-time environments.

All we need is:

 * Properties file (*.properties)
 * [commons-configuration 1.9][commons-configuration-web] dependency
 * A Factory class
 * A Configuration class

# Dev configuration framework

## Factory Class (Singleton)

    public class ConfigFactory
    {
        private static ConfigFactory configFactory;
        private Config defaultConfig;

        private ConfigFactory()
        {
            try
            {
                // Default configuration with properties files
                Configuration configuration = new
                    PropertiesConfiguration("configuration.properties");
                this.defaultConfig = new Config(configuration);
            }
            catch (ConfigurationException e)
            {
                e.printStackTrace();
            }

        }

        public static ConfigFactory getInstance()
        {
            if (configFactory == null)
                configFactory = new configFactory();
            return configFactory;
        }

        public Config createConfig(Configuration configuration)
        {
            return new Config(configuration);
        }

        public Config getDefaultConfig()
        {
            return defaultConfig;
        }

        public void setDefaultConfig(Config defaultConfig)
        {
            this.defaultConfig = defaultConfig;
        }
    }

## Config class

    public class Config
    {
        private Configuration configuration;

        public Config(Configuration configuration)
        {
            this.configuration = configuration;
        }

        public Boolean isActiveFeatureOne()
        {
            return this.configuration.getBoolean("feature.one");
        }

        public String getHostHttpUrl()
        {
            return this.configuration.getBoolean("host.http.url");
        }
    }



## Properties file (configuration.properties)

Commons-configuration 1.9 search [properties files][property-files] on:

 * in the current directory
 * in the user home directory
 * in the classpath

Example file:

    feature.one=true
    host.http.url=http://www.google.com

# How-to use it

## Use default configuration

    Config appConfig = ConfigFactory.getInstance().getDefaultConfig();
    if(appConfig.isActiveFeatureOne())
    {
       ...
    }

## Create another configuration, with another config file

    XMLConfiguration config = new XMLConfiguration("configuration.xml");
    Config appConfig = ConfigFactory.getInstance().createConfig(config);
    if(appConfig.isActiveFeatureOne())
    {
       ...
    }

## Create another configuration, and set-up as default

    XMLConfiguration config = new XMLConfiguration("configuration.xml");
    ConfigFactory.getInstance().setDefaultConfig(config);
    ...
    Config appConfig = ConfigFactory.getInstance().getDefaultConfig();
    if(appConfig.isActiveFeatureOne())
    {
       ...
    }

[commons-configuration-web]: http://commons.apache.org/configuration/
[property-files]: http://commons.apache.org/configuration/userguide/howto_properties.html#Properties_files
