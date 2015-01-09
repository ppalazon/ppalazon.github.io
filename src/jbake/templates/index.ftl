<#include "header.ftl">
	
	<#include "menu.ftl">	

  	  <div class="row">
          <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
	            <#list posts as post>
			  		      <#if (post.status == "published")>
			  			        <div class="post-preview">
		                      <a href="${post.uri}">
		                          <h2 class="post-title">
		                              <#escape x as x?xml>${post.title}</#escape>
		                          </h2>
		                          <h3 class="post-subtitle">
		                              ${(post.subtitle)!""}
		                          </h3>
		                      </a>
		                      <p class="post-meta">
                              Posted by <a href="about.html">${(post.author)!"Pablo Palazón"}</a> on ${post.date?string("MMMM dd, yyyy")}
                              <ul class="list-inline">
                                  <#list post.tags as tag>
                                      <li class="label label-warning"><a href="tags/${tag?trim}.html">${tag?trim}</a></li>
                                  </#list>
                              </ul>
                          </p>
		                  </div>
				  	      </#if>
			  	    </#list>
                
              <hr>
              <!-- Pager -->
              <ul class="pager">
                  <li class="next">
                      <a href="/${config.archive_file}">Older Posts &rarr;</a>
                  </li>
              </ul>
          </div>
      </div>

<#include "footer.ftl">
