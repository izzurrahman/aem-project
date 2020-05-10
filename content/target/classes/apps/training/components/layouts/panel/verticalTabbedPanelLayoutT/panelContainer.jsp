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
<%@ page import="com.adobe.aemds.guide.service.AdaptiveFormConfigurationService" %>
<guide:initializeBean name="panelWrapperForFragmentContext" className="com.adobe.aemds.guide.common.GuidePanel"
                      resourcePath="${guidePanel.path}" restoreOnExit="true" manageFragmentContext="true">
<%
    AdaptiveFormConfigurationService adaptiveFormConfigurationService = sling.getService(AdaptiveFormConfigurationService.class);
%>
<c:set var="showFragmentPlaceholder" value="<%= adaptiveFormConfigurationService.getShowPlaceholder()%>"/>
<div id="${guidePanel.id}_guide-item-container" class="tab-content afTabTopPanelContent">
    <c:if test="${guidePanel.hasToolbar  && guidePanel.toolbarPosition == 'Top'}">
        <sling:include path="${guidePanel.toolbar.path}"/>
    </c:if>
<c:forEach items="${guidePanel.items}" var="panelItem">
    <div class="tab-pane" id="${panelItem.id}_guide-item" role="tabpanel">
        <c:set var="isNestedLayout" value="${guide:hasNestablePanelLayout(guidePanel,panelItem)}"/>
        <c:if test="${isNestedLayout}">
            <guide:initializeBean name="guidePanel" className="com.adobe.aemds.guide.common.GuidePanel"
                                  resourcePath="${panelItem.path}" restoreOnExit="true">
                <c:if test="${!(isEditMode && not empty guidePanel.fragRef  && showFragmentPlaceholder) }">
                    <c:set target="${guideLayoutContext}" property="layoutNavigatorClasses" value="hidden-xs"/>
                    <sling:include path="${panelItem.path}" resourceType="fd/af/layouts/panel/verticalTabbedPanelLayout" replaceSelectors="defaultNavigatorLayout"/>
                    <c:set var="guidePanelLayout" value="fd/af/layouts/panel/verticalTabbedPanelLayout" scope="request"/>
                    <c:set var="guidePanelLayoutContainerSelector" value="panelContainer" scope="request"/>
                </c:if>
            </guide:initializeBean>
        </c:if>
        <sling:include path="${panelItem.path}" resourceType="${panelItem.resourceType}"/>
    </div>
    <c:set var="guidePanelLayout" value="" scope="request"/>
    <c:set var="guidePanelLayoutContainerSelector" value="" scope="request"/>
</c:forEach>
    <c:if test="${guidePanel.hasToolbar  && guidePanel.toolbarPosition == 'Bottom'}">
        <sling:include path="${guidePanel.toolbar.path}"/>
    </c:if>
</div>
</guide:initializeBean>