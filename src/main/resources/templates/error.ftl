<html>
<body>
<h1>Something went wrong</h1>
<p>It looks like some error occurred while trying to complete the desired action.</p>
<#if errorText?has_content>
    <b>Error: ${errorText}</b>
</#if>
<br>
<p>You can go to home page and try again</p>
<a href="/">Home</a>
</body>
</html>
