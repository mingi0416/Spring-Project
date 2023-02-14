<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page session="false"%>
${savedName}${savedName2}
<script>

var result = '${savedName}';

parent.addFilePath(result);

</script>

