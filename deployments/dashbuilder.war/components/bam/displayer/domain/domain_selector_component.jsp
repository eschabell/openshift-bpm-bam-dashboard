<%--

    Copyright (C) 2012 JBoss Inc

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

          http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

--%>
<%@ page import="org.jboss.dashboard.LocaleManager" %>
<%@ page import="org.jboss.dashboard.ui.components.AbstractChartDisplayerEditor" %>
<%@ page import="org.jboss.dashboard.displayer.chart.AbstractChartDisplayer" %>
<%@ page import="org.jboss.dashboard.provider.DataProperty" %>
<%@ page import="java.util.Locale" %>
<%@ page import="org.jboss.dashboard.domain.DomainConfiguration" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="org.jboss.dashboard.DataDisplayerServices" %>
<%@ page import="java.util.List" %>
<%@taglib uri="factory.tld" prefix="factory"%>
<%@taglib uri="mvc_taglib.tld" prefix="mvc"%>
<%@ taglib uri="bui_taglib.tld" prefix="panel"%>
<%@ taglib prefix="static" uri="static-resources.tld" %>
<%@taglib uri="http://jakarta.apache.org/taglibs/i18n-1.0" prefix="i18n"%>
<i18n:bundle id="bundle" baseName="org.jboss.dashboard.displayer.messages" locale="<%=LocaleManager.currentLocale()%>"/>
<%
    Locale locale = LocaleManager.currentLocale();
    AbstractChartDisplayerEditor editor = (AbstractChartDisplayerEditor) request.getAttribute("editor");
    AbstractChartDisplayer displayer = (AbstractChartDisplayer) editor.getDataDisplayer();
    DataProperty domainProperty = displayer.getDomainProperty();
%>
    <td align="left">
        <select name="idDomainDetails" title="<%= domainProperty.getName(locale) %>" id="<factory:encode name="idDomainDetails"/>" class="skn-input"
                style="width:95px; height:18px; text-align:left; overflow:hidden; vertical-align:middle"
                onChange="return bam_kpiedit_submitProperties(this);"
                >
        <%
            List<DataProperty> domainProperties = Arrays.asList(displayer.getDomainPropertiesAvailable().clone());
            DataDisplayerServices.lookup().getDataProviderManager().sortDataPropertiesByName(domainProperties, true);

            for (DataProperty dataProperty : domainProperties) {
                String selected = "";
                if (dataProperty.getPropertyId().equals(domainProperty.getPropertyId())) selected = "selected";
        %>
                <option title="<%= dataProperty.getName(locale) %>" value="<%= dataProperty.getPropertyId() %>" <%= selected %>>
                    <%= dataProperty.getName(locale) %>
                </option>
        <%
            }
        %>
        </select>
        &nbsp;
        <a style="border:0" href="#" onclick="window.<factory:encode name="editDomain "/>(); return false;">
            <img src="<static:image relativePath="general/16x16/ico-edit.png"/>" border="0"
                     title="<i18n:message key='<%= AbstractChartDisplayerEditor.I18N_PREFFIX + "editar_domain"%>'>!!Editar domain</i18n:message>"
                     style="vertical-align:middle">
        </a>
    </td>
    <td align="left">
        <div id="<factory:encode name="idDomain"/>" align="center" style="width:500px;height:300px; overflow:-moz-scrollbars-horizontal; overflow-x:hidden;overflow-y:auto; display:none;position:absolute;vertical-align:middle;z-index:11;">
            <table width="100%" align="center" border="0" bgcolor="#FFFFFF" cellpadding="4" cellspacing="1" class="skn-table_border">
                <tr class="skn-table_header">
                    <td colspan="5">
                        <i18n:message key='<%= AbstractChartDisplayerEditor.I18N_PREFFIX + "editar_domain"%>'>!!Editar domain</i18n:message>
                    </td>
                </tr>
                <%  request.setAttribute("domainConfig", new DomainConfiguration(displayer.getDomainProperty())); %>
                <mvc:include page="domain_details.jsp" flush="true" />
                <% request.removeAttribute("domainConfig"); %>
            </table>
        </div>
    </td>
    <script defer="true">
        window.<factory:encode name="editDomain "/> = function() {
            var element = document.getElementById('<factory:encode name="idDomain"/>');
            if (element.style.display == "none") element.style.display = "block";
            else element.style.display = "none";
        }
    </script>