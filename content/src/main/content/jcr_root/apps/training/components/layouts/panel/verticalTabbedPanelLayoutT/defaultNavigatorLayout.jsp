<%------------------------------------------------------------------------
 ~
 ~ ADOBE CONFIDENTIAL
 ~ __________________
 ~
 ~  Copyright 2014 Adobe Systems Incorporated
 ~  All Rights Reserved.
 ~
 ~ NOTICE:  All information contained herein is, and remains
 ~ the property of Adobe Systems Incorporated and its suppliers,
 ~ if any.  The intellectual and technical concepts contained
 ~ herein are proprietary to Adobe Systems Incorporated and its
 ~ suppliers and may be covered by U.S. and Foreign Patents,
 ~ patents in process, and are protected by trade secret or copyright law.
 ~ Dissemination of this information or reproduction of this material
 ~ is strictly forbidden unless prior written permission is obtained
 ~ from Adobe Systems Incorporated.
 --------------------------------------------------------------------------%>
<%@include file="/libs/fd/af/components/guidesglobal.jsp"%>
<%@ page import="com.adobe.aemds.guide.utils.StyleUtils" %>
<guide:initializeBean name="panelWrapperForFragmentContext" className="com.adobe.aemds.guide.common.GuidePanel"
                      resourcePath="${guidePanel.path}" restoreOnExit="true" manageFragmentContext="true">
<div class="col-md-1 col-sm-1 guide-tab-scroller guide-tab-scroller-previous hidden-xs"
    data-guide-nav-scroll="left">
</div>
<div class="col-md-10 col-sm-10">
    <ul id="${guidePanel.id}_guide-item-nav-container"
        class="tab-navigators ${guideLayoutContext.layoutNavigatorClasses} in"
        data-guide-panel-edit="reorderItems" role="tablist">
        <c:forEach items="${guidePanel.items}" var="panelItem">
            <c:set var="isNestedLayout" value="${guide:hasNestablePanelLayout(guidePanel,panelItem)}"/>
            <li id="${panelItem.id}_guide-item-nav" title="${guide:encodeForHtmlAttr(panelItem.navTitle,xssAPI)}" data-path="${panelItem.path}"  role="tab" aria-controls="${panelItem.id}_guide-item">
                <c:set var="panelItemCss" value="${panelItem.cssClassName}"/>
                <% String panelItemCss = (String) pageContext.getAttribute("panelItemCss");%>
                <a data-guide-toggle="tab" class="<%= StyleUtils.addPostfixToClasses(panelItemCss, "_nav") %> guideNavIcon guideTopNavIcon nested_${isNestedLayout}">
                    <span data-guide-prop="title" data-guide-id="${panelItem.id}">${guide:encodeForHtml(panelItem.navTitle,xssAPI)}</span>
                </a>
            </li>
        </c:forEach>
    </ul>
</div>
<div class="col-md-1 col-sm-1 guide-tab-scroller guide-tab-scroller-next hidden-xs"
    data-guide-nav-scroll="right">
</div>
</guide:initializeBean>