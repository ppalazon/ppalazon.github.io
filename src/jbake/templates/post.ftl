<#include "header.ftl">
	
	<#include "menu.ftl">

	<div class="row">
        <div class="col-lg-12 col-md-12">
        	<p class="post-meta">Posted by <a href="/about.html">${(content.author)!config.author}</a> on ${content.date?string("MMMM dd, yyyy")}</p>
            <p>
            	${content.body}
            </p>
        </div>
    </div>
	
<#include "footer.ftl">