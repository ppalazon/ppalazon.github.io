<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8"/>
    <base href="${config.base}"/>
    <title><#if (content.title)??><#escape x as x?xml>${content.title}</#escape><#else><#escape x as x?xml>${config.author}</#escape></#if></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="google-site-verification" content="uw7QXxk8h88xsi6Tv2LDlrOhxuDuE5zObJPs8NVdmRw" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Pablo Palazon personal blog">
    <meta name="author" content="${config.author}">
    <meta name="keywords" content="Pablo Palazón, ppalazon, devops, developer, java, blog, personal blog, software, programming, reactive programming, reactive, systems, electronics, arm">
    <!-- RSS Links -->
    <link href="/${config.feed_file}" rel="alternate" type="application/rss+xml" title="Pablo Palazon Blog - RSS">
    <!-- Le styles -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <!--<link href="/css/asciidoctor.css" rel="stylesheet">-->
    <link href="/css/clean-blog.min.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" href="favicon-152.png">
    <link rel="icon" href="favicon-96.png">
    <link rel="shortcut icon" href="favicon.ico">
  </head>
  <body>
    <div id="wrap">
   