$env:JAVA_HOME = "C:\Projetos\GvGo\.jdk\jdk-25.0.2+10"
$env:Path = "$env:JAVA_HOME\bin;$env:Path"

.\mvnw.cmd test
