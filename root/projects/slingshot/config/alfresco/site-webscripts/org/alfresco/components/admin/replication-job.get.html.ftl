<#assign jobName = page.url.args.jobName!"">
<#assign mode = (jobName = "")?string("create", "edit")>
<#assign action = url.context + "/proxy/alfresco/api/replication-definition" + (jobName = "")?string("s", "/" + jobName?url)>

<#assign id = args.htmlid?html>
<div id="${id}-body" class="form-manager replication-job">
   <h1>${msg("header." + mode, jobName)}</h1>
</div>

<#if mode == "edit" && !(jobDetail.name??)>
   <div class="error">${msg("message.no-job-details", jobName)}</div>
<#else>
<script type="text/javascript">//<![CDATA[
   new Alfresco.component.ReplicationJob("${args.htmlid?js_string}").setOptions(
   {
      jobName: "${jobName?js_string}",
      payload: [<#list jobDetail.payload![] as p>"${p.nodeRef?js_string}"<#if p_has_next>,</#if></#list>],
      targetName: "${(jobDetail.targetName!"")?js_string}"
   }).setMessages(${messages});
//]]></script>

<div class="share-form">
   <div class="form-container">
      <div class="caption"><span class="mandatory-indicator">${msg("form.required.fields.marker")}</span>${msg("form.required.fields")}</div>
      <form id="${id}-form" method="post" action="${action}">
         <div id="${id}-form-fields" class="form-fields">

            <div class="set-title">${msg("label.set.general")}</div>
            <div class="form-field">
               <label for="${id}-prop_name">${msg("label.name")}:<span class="mandatory-indicator">${msg("form.required.fields.marker")}</span></label>
               <input type="text" id="${id}-prop_name" name="name" tabindex="0" title="${msg("label.name")}" value="${(jobDetail.name!"")?html}" />
            </div>
            <div class="form-field">
               <label for="${id}-prop_description">${msg("label.description")}:</label>
               <textarea id="${id}-prop_description" name="description" rows="2" cols="60" tabindex="0" title="${msg("label.description")}">${(jobDetail.description!"")?html}</textarea>
            </div>

            <div class="set-title">${msg("label.set.payload")}</div>
            <div id="${id}-payloadContainer"></div>

            <div class="set-title">${msg("label.set.transfer-target")}</div>
            <div id="${id}-transferTargetContainer"></div>

            <div class="set-title" style="display:none;">${msg("label.set.schedule")}</div>
            <div id="${id}-scheduleContainer"></div>

            <div class="set-title">${msg("label.set.other")}</div>
            <div class="form-field">
               <input id="${id}-prop_enabled" type="hidden" name="enabled" value="${(jobDetail.enabled!false)?string}">
               <input id="${id}-prop_enabled-entry" type="checkbox" tabindex="0" name="-" title="${msg("label.enabled")}" <#if jobDetail.enabled!false>checked="checked"</#if> onchange="javascript:YUIDom.get('${id}-prop_enabled').value=this.checked;">
               <label for="${id}-prop_enabled-entry" class="checkbox">${msg("label.enabled")}</label>
            </div>
         </div>

         <div id="${id}-form-buttons" class="form-buttons">
            <span id="${id}-form-submit" class="yui-button yui-submit-button yui-button-disabled yui-submit-button-disabled">
               <span class="first-child">
                  <button type="button" tabindex="0" name="-">${msg("button." + mode + "-job")}</button>
               </span>
            </span>
            &nbsp;
            <span id="${id}-form-cancel" class="yui-button yui-push-button">
               <span class="first-child">
                  <button type="button" tabindex="0" name="-">${msg("button.cancel")}</button>
               </span>
            </span>
         </div>
      </form>
   </div>
</div>
</#if>