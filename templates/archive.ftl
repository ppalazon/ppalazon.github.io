<#include "header.ftl">

	<#include "menu.ftl">

	<div class="row">
    	<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
	
			<!--<ul>-->
				<#list published_posts as post>
				<#if (last_month)??>
					<#if post.date?string("MMMM yyyy") != last_month>
						</ul>
						<h4>${post.date?string("MMMM yyyy")}</h4>
						<ul>
					</#if>
				<#else>
					<h4>${post.date?string("MMMM yyyy")}</h4>
					<ul>
				</#if>
				
				<li>${post.date?string("dd")} - <a href="${post.uri}"><#escape x as x?xml>${post.title}</#escape></a></li>
				<#assign last_month = post.date?string("MMMM yyyy")>
				</#list>
			</ul>
		</div>
	</div>
	
<#include "footer.ftl">