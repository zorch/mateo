<%-- 
    Document   : nuevo
    Created on : Mar 07, 2013, 10:37:52 AM
    Author     : osoto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <title><s:message code="ciudad.edita.label" /></title>
    </head>
    <body>
        <jsp:include page="../menu.jsp" >
            <jsp:param name="menu" value="ciudad" />
        </jsp:include>

        <div id="edita-ciudad" class="content scaffold-list" role="main">
            <h1><s:message code="ciudad.edita.label" /></h1>
            <p class="well">
                <a class="btn btn-primary" href="<s:url value='/colportaje/ciudad'/>"><i class="icon-list icon-white"></i> <s:message code='ciudad.lista.label' /></a>
            </p>
            <c:url var="actualizaUrl" value="/colportaje/ciudad/actualiza" />
            <form:form commandName="ciudad" method="post" action="${actualizaUrl}">
                <form:errors path="*">
                    <div class="alert alert-block alert-error fade in" role="status">
                        <a class="close" data-dismiss="alert">×</a>
                        <c:forEach items="${messages}" var="message">
                            <p>${message}</p>
                        </c:forEach>
                    </div>
                </form:errors>
                <form:hidden path="id" />
                <form:hidden path="version" />

                <fieldset>
                    <s:bind path="ciudad.nombre">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="nombre">
                                <s:message code="nombre.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:input path="nombre" maxlength="128" required="true" />
                            <form:errors path="nombre" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                <fieldset>
                    <s:bind path="ciudad.estado">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="estado">
                                <s:message code="estado.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:select id="estado" path="estado.id" required="true" cssClass="span11" >
                                <form:options items="${estados}" itemValue="id" itemLabel="nombre"/>
                            </form:select>
                            <form:errors path="estado" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                </fieldset>

                <p class="well" style="margin-top: 10px;">
                    <button type="submit" name="actualizarBtn" class="btn btn-primary btn-large" id="actualizar" ><i class="icon-ok icon-white"></i>&nbsp;<s:message code='actualizar.button'/></button>
                    <a class="btn btn-large" href="<s:url value='/colportaje/ciudad/ver/${ciudad.id}'/>"><i class="icon-remove"></i> <s:message code='cancelar.button' /></a>
                </p>
            </form:form>
        </div>
    </body>
</html>
